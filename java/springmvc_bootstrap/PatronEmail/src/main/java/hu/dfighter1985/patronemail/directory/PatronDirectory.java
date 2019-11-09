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

package hu.dfighter1985.patronemail.directory;

import hu.dfighter1985.patronemail.model.Patron;
import java.util.ArrayList;
import java.util.List;

public class PatronDirectory
{
    private final List< Patron > patrons;
    
    public PatronDirectory()
    {
        patrons = new ArrayList< Patron >();
        
        patrons.add( new Patron( 1, "Arnold", "Andrews", "aa@company.com" ) );
        patrons.add( new Patron( 2, "Chloe", "Cartwright", "cc@company.com" ) );
        patrons.add( new Patron( 3, "Arnold", "Andrews", "aa2@company.com" ) );
        patrons.add( new Patron( 4, "Lisa", "Lisboa", "ll@company.com" ) );
    }
    
    public Patron getPatronById( final long id )
    {
        for( final Patron patron : patrons )
        {
            if( patron.getId() == id )
            {
                return patron;
            }
        }
        
        return null;
    }
    
    public List< Patron > getPatronByName( final String firstName, final String lastName )
    {
        final List< Patron > results = new ArrayList< Patron >();
        
        for( final Patron patron : patrons )
        {
            if( patron.getFirstName().equals( firstName ) && patron.getLastName().equals( lastName ) )
            {
                results.add( patron );
            }
        }
        
        return results;
    }
    
    public void updatePatron( final Patron patron )
    {
        for( final Patron myPatron : patrons )
        {
            if( myPatron.getId() == patron.getId() )
            {
                myPatron.setEmail( patron.getEmail() );
            }
        }
    }
}
