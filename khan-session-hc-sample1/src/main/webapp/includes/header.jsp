<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="com.opennaru.khan.session.filter.Version" %>
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

<%--
  Created by IntelliJ IDEA.
  User: jjeon
  Date: 4/17/14
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<table cellspacing="4" border="0">
    <tr>
        <td colspan="2">
            <a href="http://www.opennaru.com/">
                <img border="0" alt="opennaru.com" width="400" height="80" align="left" src="images/opennaru_logo.png">
            </a>
            <a href="http://www.opennaru.com/">
                <img border="0" alt="KHAN [session manager]" width="160" height="80" align="right" src="images/khan_sessionmanager.png">
            </a>
        </td>
    </tr>
</table>

<hr size="1" noshade="noshade">
<table cellspacing="4" border="0">
    <tr>
        <td colspan="1" style="text-align:right">
            <b>KHAN [session manager] HotRod Version</b>의 세션 테스트를 위한 페이지입니다.
        </td>
    </tr>
    <tr>
        <td colspan="1" style="text-align:right">
            <b>Version <%=Version.getInstance().getVersionShort()%></b>, Build : <%=Version.getInstance().getBuild()%>, Date : <%=Version.getInstance().getBuildDateAsString()%>
        </td>
    </tr>
    <tr>
        <td colspan="1" style="text-align:right">
            * 기술지원 : <a href="http://support.opennaru.com/">http://support.opennaru.com/</a>
        </td>
    </tr>
    <tr>
        <td colspan="1" style="text-align:right">
            * 제품문의 : <a href="mailto:service@opennaru.com">service@opennaru.com</a>
        </td>
    </tr>
</table>