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

package test;

import com.opennaru.khan.session.util.StringUtils;

/**
 * Created by jjeon on 12/13/14.
 */
public class TestProperty {

    public static void main(String args[]) {
        System.setProperty("test.test", "234");
        String str = "${test.test:123}";
        String value = "";
        String defaultValue = "";
        if( str.startsWith("${") && str.endsWith("}") ) {
            String variable = str.substring(2, str.length()-1);
            if( variable.contains(":") ) {
                defaultValue = variable.substring(variable.indexOf(":")+1);
                variable = variable.substring(0, variable.indexOf(":") );
            }
            System.out.println(variable);
            System.out.println(defaultValue);
            System.out.println(value);
            value = System.getProperty(variable);
            if(StringUtils.isNullOrEmpty(value)) {
                value = defaultValue;
            }
            System.out.println(value);
        }

    }
}
