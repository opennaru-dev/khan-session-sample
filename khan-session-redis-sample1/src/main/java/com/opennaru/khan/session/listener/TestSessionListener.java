/*
 * Opennaru, Inc. http://www.opennaru.com/
 *
 *  Copyright (C) 2014 Opennaru, Inc. and/or its affiliates.
 *  All rights reserved by Opennaru, Inc.
 *
 *  This is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU Lesser General Public License as
 *  published by the Free Software Foundation; either version 2.1 of
 *  the License, or (at your option) any later version.
 *
 *  This software is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this software; if not, write to the Free
 *  Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 *  02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */
package com.opennaru.khan.session.listener;

import com.opennaru.khan.session.filter.KhanSessionStore;
import com.opennaru.khan.session.manager.KhanSessionManager;
import com.opennaru.khan.session.store.SessionId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

/**
 * SessionListener for destroy KHAN Session
 *
 * @author Junshik Jeon(service@opennaru.com, nameislocus@gmail.com)
 */
public class TestSessionListener implements HttpSessionListener {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * Default Constructor
     */
    public TestSessionListener() {

    }

    /**
     * Session Created
     * @param sessionEvent
     */
    @Override
    public void sessionCreated(HttpSessionEvent sessionEvent) {
        // Get the session that was created
        HttpSession session = sessionEvent.getSession();

        // Store something in the session, and log a message
        try {
            if( log.isDebugEnabled() ) {
                log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> created sessionEvent=" + sessionEvent);
                log.debug("Session created=" + session.getId());
            }

            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> created sessionEvent=" + sessionEvent);
            System.out.println("Session created=" + session.getId());

            String sessionId = (String) session.getId();
            System.out.println("***** Session Id=" + sessionId);

            String khanSessionId = SessionId.getKhanSessionId(session.getId());
            System.out.println("***** KHAN Session ID in SessionId=" + khanSessionId);

            String khanSessionId1 = (String) session.getAttribute("khan.session.id");
            System.out.println("***** KHAN Session ID khan.session.id=" + khanSessionId1);

            String appName = sessionEvent.getSession().getServletContext().getContextPath();

            System.out.println("appName=" + appName);

            //KhanSessionManager.getInstance(appName).


            HashMap hashMap = new HashMap();
            hashMap.put("A1", "String1");
            hashMap.put("A2", 10);

            ArrayList list = new ArrayList();
            list.add(hashMap);

//            session.setAttribute("TEST", list);
//            System.out.println("TEST=" + session.getAttribute("TEST"));

            KhanSessionStore.setAttribute(session, "TEST", list);

            Enumeration<String> e = session.getAttributeNames();
            while( e.hasMoreElements() ) {
                String key = e.nextElement();
                System.out.print("key=" + key + ",");
                System.out.println("value=" + session.getAttribute(key));
            }

            //KhanSessionManager.getInstance(appName).putSessionId(session);

        } catch (Exception e) {
            log.error("Error in setting session attribute: "
                    + e.getMessage(), e);
        }
    }

    /**
     * Session Destroyed : Remove Session Id from KHAN Session Store
     *
     * @param sessionEvent
     */
    @Override
    public void sessionDestroyed(HttpSessionEvent sessionEvent) {
        // Get the session that was invalidated
        try {
            HttpSession session = sessionEvent.getSession();
            String sessionId = session.getId();

            // Log a message
            if( log.isDebugEnabled() ) {
                log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> destroy sessionEvent=" + sessionEvent);
                log.debug("Session invalidated: " + sessionId);
            }
            log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> destroy sessionEvent=" + sessionEvent);
            log.debug("Session invalidated: " + sessionId);

        } catch (Exception e) {
            log.error("Error destroy event", e);
        }
    }

}