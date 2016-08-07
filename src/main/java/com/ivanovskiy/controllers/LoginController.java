package com.ivanovskiy.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(
            HttpServletRequest request, HttpServletResponse response,
            Principal principal, Authentication auth) throws IOException {

        HttpSession session = request.getSession();

        Collection<? extends GrantedAuthority> auths = auth.getAuthorities();
        session.setAttribute("auths", auths);
        String name = principal.getName();
        session.setAttribute("login", name);
        response.sendRedirect("/gettests");
        return null;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model){

        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap model){

        return "logout";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(ModelMap model){

        return "index";
    }

    @RequestMapping(value = "/failure", method = RequestMethod.GET)
    public String failure(ModelMap model){

        return "failure";
    }
}