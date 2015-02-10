<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@page import="com.opennaru.khan.session.listener.SessionLoginManager"%>
<%@ page import="java.util.Enumeration" %>
<%--
  ~ Opennaru, Inc. http://www.opennaru.com/
  ~
  ~  Copyright (C) 2014 Opennaru, Inc. and/or its affiliates.
  ~  All rights reserved by Opennaru, Inc.
  ~
  ~  This is free software; you can redistribute it and/or modify it
  ~  under the terms of the GNU Lesser General Public License as
  ~  published by the Free Software Foundation; either version 2.1 of
  ~  the License, or (at your option) any later version.
  ~
  ~  This software is distributed in the hope that it will be useful,
  ~  but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  ~  Lesser General Public License for more details.
  ~
  ~  You should have received a copy of the GNU Lesser General Public
  ~  License along with this software; if not, write to the Free
  ~  Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
  ~  02110-1301 USA, or see the FSF site: http://www.fsf.org.
  --%>
<html>
<%@include file="includes/head.jsp"%>
<body>

<%@include file="includes/header.jsp"%>

<br><hr>
<center>
    <a href=index.jsp>HOME</a> | <a href=login.jsp>LOGIN</a> | <a href=logout.jsp>LOGOUT</a>
</center>
<br><br>

<h1>Login Test</h1>
<br>
<br>
<form action='login_process.jsp' method='post'>
    <table border="1" cellspacing="0" cellpadding="3">
        <tr>
            <td colspan="2" class="title">User Login</td>
        </tr>
        <tr>
            <td class="header-left">Userid</td>
            <td><input type='text' name='USERID'></td>
        </tr>
        <tr>
            <td class="header-left">Password</td>
            <td><input type='password' name='PASSWD'></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type='submit' value='Login'>
            </td>
        </tr>
    </table>
    <br>
</form>

<br>
<br>


<%@include file="includes/tail.jsp"%>

</body>
</html>