/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ricardo
 */
public class Return {


    public static boolean retorna(String amigo, int namigo, HttpServletRequest request) {
        request.getSession().setAttribute(amigo, namigo);
        return true;
    }

}
