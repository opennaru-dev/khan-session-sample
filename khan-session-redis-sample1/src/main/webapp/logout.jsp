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

<%
    SessionLoginManager loginManager = SessionLoginManager.getInstance();
    loginManager.logout(request);
    session.invalidate();

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

//    out.println("userid=" + loginManager.loggedInUserId(request));
%>
<h1>Force logout</h1>
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
        if( names != null ) {
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
        }
    %>
</table>

<br>
<br>

<%@include file="includes/tail.jsp"%>

</body>
</html>