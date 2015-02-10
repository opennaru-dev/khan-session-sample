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

<%@ page session="true" %>

<%

    Integer test = new Integer(10);
    session.putValue ("test", test);

    // Get the session data value
    Integer ival = (Integer) session.getValue ("counter");
    if (ival == null) ival = new Integer (1);
    else ival = new Integer (ival.intValue() + 1);
    session.putValue ("counter", ival);

    SessionLoginManager loginManager = SessionLoginManager.getInstance();
//    out.println("userid=" + loginManager.loggedInUserId(request));

    if( request.getParameter("NAME") != null ) {
        session.putValue(request.getParameter("NAME"), request.getParameter("VALUE"));
    }

    String jsessionid = "";
    Cookie[] cookies = null;

    cookies = request.getCookies();
    if( cookies != null ){
        for (int i = 0; i < cookies.length; i++){
            if( cookies[i].getName().equals("JSESSIONID") ) {
                jsessionid = cookies[i].getValue();
            }
        }
    }

    System.out.println("KHAN_SID=" + session.getId() + "/JSESSIONID=" + jsessionid);

%>
<br>
<br>
<table border="1" cellspacing="0" cellpadding="3">
    <tr>
        <td colspan="2" class="title">세션 정보</td>
    </tr>
    <tr>
        <td class="header-left">KHAN 세션 ID</td>
        <td class="row-left"><b><%=session.getId() %></b></td>
    </tr>
    <tr>
        <td class="header-left">JSESSIONID</td>
        <td class="row-left"><b><%=jsessionid %></b></td>
    </tr>
    <tr>
        <td class="header-left">세션 생성 시간</td>
        <td class="row-left"><%=new java.util.Date(session.getCreationTime()).toString() %></td>
    </tr>
    <tr>
        <td class="header-left">세션마지막접속시간</td>
        <td class="row-left"><%=new java.util.Date(session.getLastAccessedTime()).toString() %></td>
    </tr>
    <tr>
        <td class="header-left">isNew()</td>
        <td class="row-left"><%=session.isNew()%></td>
    </tr>
    <tr>
        <td class="header-left">Visit 카운터</td>
        <td class="row-left"><b style="color: red;"><%= ival %> times.</b></td>
    </tr>
    <tr>
        <td class="header-left">세션의 User ID</td>
        <td class="row-left"><%=loginManager.loggedInUserId(request) %></td>
    </tr>

</table>

<br>
<br>

<table border="1" cellspacing="0" cellpadding="3">
    <tr>
        <td colspan="2" class="title">세션 Attributes</td>
    </tr>
    <tr>
        <td class="header-left">Name</td>
        <td class="header-left">Values</td>
    </tr>
    <%
        Enumeration names = session.getAttributeNames();
        while (names.hasMoreElements()) {
            String name = (String) names.nextElement();
            String value = session.getAttribute(name).toString();

    %>
    <tr>
        <td class="row-left"><%=name%></td>
        <td class="row-left"><%=value%></td>
    </tr>
    <%
        }
    %>
</table>

<br>
<br>

<form action='index.jsp' method='post'>
    <table border="1" cellspacing="0" cellpadding="3">
        <tr>
            <td colspan="2" class="title">Put Session Data</td>
        </tr>
        <tr>
            <td class="header-left">Name</td>
            <td><input type='text' name='NAME'></td>
        </tr>
        <tr>
            <td class="header-left">Value</td>
            <td><input type='text' name='VALUE'></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type='submit' value='PUT Session Data'>
            </td>
        </tr>
    </table>
    <br>
</form>

<br>

<%@include file="includes/tail.jsp"%>

</body>
</html>