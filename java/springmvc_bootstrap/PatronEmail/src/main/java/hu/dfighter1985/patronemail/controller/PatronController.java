/*
MIT License
Copyright (c) 2019 dfighter1985
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package hu.dfighter1985.patronemail.controller;

import hu.dfighter1985.patronemail.directory.PatronDirectory;
import hu.dfighter1985.patronemail.model.EditPatron;
import hu.dfighter1985.patronemail.model.Patron;
import hu.dfighter1985.patronemail.model.SearchPatron;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
class PatronController
{
    
    @Autowired
    private PatronDirectory patronDirectory;
    
    private static final Logger LOG = Logger.getLogger( PatronController.class );
    
    public PatronController()
    {
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView showIndex()
    {
        return new ModelAndView( "index" );
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView showLogin()
    {
        return new ModelAndView( "login" );
    }
    
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView showPatronSearchForm()
    {
        return new ModelAndView( "searchPatron", "SearchPatron", new SearchPatron() );
    }
    
    private List< Patron > doSearch( final SearchPatron search )
    {
        List< Patron > results = null;
        
        if( ! search.getId().isEmpty() )
        {
            results = new ArrayList< Patron >();
            long id = -1;
            
            try
            {
                id = Long.parseLong( search.getId() );
            }
            catch( final NumberFormatException nfe )
            {
                LOG.error( "Error parsing '" + search.getId() + "' as a long", nfe );
            }
            
            final Patron p = patronDirectory.getPatronById( id );
            if( p != null )
            {
                results.add( p );
            }
        }
        else
        {
            results = patronDirectory.getPatronByName(
                    search.getFirstName(),
                    search.getLastName()
            );
        }
        return results;
    }
    
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ModelAndView searchPatron( @ModelAttribute("SearchPatron") SearchPatron patron, BindingResult result, ModelMap model )
    {
        if( result.hasErrors() )
        {
            return new ModelAndView( "searchPatronError" );
        }
        
        List< Patron > results = doSearch( patron );        
        
        final ModelAndView mv = new ModelAndView( "searchPatron", "SearchPatron", new SearchPatron() );
        mv.addObject( "patrons", results );
        return mv;
    }
    
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView showPatronEditForm( @RequestParam("id") final long id )
    {
        final Patron patron = patronDirectory.getPatronById( id );
        if( patron == null )
        {
            final ModelAndView mv = new ModelAndView( "editPatronError" );
            mv.addObject( "message", "No such patron!" );
            return mv;
        }
        
        final EditPatron editPatron = new EditPatron();
        editPatron.setId( patron.getId() );
        editPatron.setEmail( patron.getEmail() );
        
        final ModelAndView mv = new ModelAndView( "editPatron", "EditPatron", editPatron );
        mv.addObject( "patron", patron );
        return mv;
    }
    
    @RequestMapping(value="/edit", method = RequestMethod.POST)
    public ModelAndView editPatron( @ModelAttribute("EditPatron") EditPatron data, BindingResult result, ModelMap model )
    {
        if( result.hasErrors() )
        {
            final ModelAndView mv = new ModelAndView( "editPatronError" );
            mv.addObject( "message", "Binding error" );
            return mv;
        }
        
        final Patron patron = patronDirectory.getPatronById( data.getId() );
        if( patron == null )
        {
            final ModelAndView mv = new ModelAndView( "editPatronError" );
            mv.addObject( "message", "Binding error" );
            return mv;
        }
        
        patron.setEmail( data.getEmail() );
        patronDirectory.updatePatron( patron );
        
        final ModelAndView mv = new ModelAndView( "editPatron", "EditPatron", data );
        mv.addObject( "message", "Patron updated" );
        mv.addObject( "patron", patron );
        return mv;
    }
}