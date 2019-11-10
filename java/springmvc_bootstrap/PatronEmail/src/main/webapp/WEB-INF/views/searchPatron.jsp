<!--
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
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Search patron</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="<c:url value="/" />">PatronEmailManager</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="<c:url value="/search" />">Search</a></li>
                    <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
                </ul>
            </div>
        </nav>
        
        <c:url var="searchUrl" value="/search" />
        <form:form action="${searchUrl}" method="POST" modelAttribute="SearchPatron">
            <table class="table table-bordered">
                <tr><td>id</td><td><form:input path="id"/></td></tr>
                <tr><td>First name</td><td><form:input path="firstName"/></td></tr>
                <tr><td>Last name</td><td><form:input path="lastName"/></td></tr>
                <tr><td colspan="2"><input type="submit" value="submit"/></td></tr>
            </table>
        </form:form>
            
        <c:if test="${patrons.size() > 0}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>first name</th>
                        <th>last name</th>
                        <th>email</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <c:forEach var="patron" items="${patrons}">
                    <!--
                        <tr><td>Id</td><td>${patron.id}</td></tr>
                        <tr><td>First name</td><td>${patron.firstName}</td></tr>
                        <tr><td>Last name</td><td>${patron.lastName}</td></tr>
                        <tr><td>Email</td><td>${patron.email}</td></tr>
                        <tr><td colspan="2"><a href="/edit?id=${patron.id}">edit</a></td></tr>
                        <tr><td colspan="2">&nbsp;</td></tr>
                    -->
                    <tr>
                        <td>${patron.id}</td>
                        <td>${patron.firstName}</td>
                        <td>${patron.lastName}</td>
                        <td>${patron.email}</td>
                        <td><a href="<c:url value="/edit?id=${patron.id}" />">edit</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
                
        <c:if test="${patrons.size() == 0}">
            <h1>No results :(</h1>
        </c:if>
            
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
