package com.ivanovskiy.controllers;

import com.ivanovskiy.dao.result.ResultEntityDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;
import java.util.Collection;

/**
 * Created by Alexey-Ivanovskiy on 06.08.2016.
 */
@Controller
public class LoginController {

    @Autowired
    private ResultEntityDAO resultDAO;

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(
            HttpServletResponse response, Principal principal,
            Authentication auth, HttpSession session) throws IOException {
        Collection<? extends GrantedAuthority> auths = auth.getAuthorities();
        session.setAttribute("auths", auths);
        String name = principal.getName();
        session.setAttribute("login", name);
        response.sendRedirect("/gettests");
        return null;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){

        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("login");
        session.removeAttribute("auths");
        return "logout";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
     public String home(){

        return "index";
    }

    @RequestMapping(value = "/failure", method = RequestMethod.GET)
    public String failure(){

        return "failure";
    }
}
