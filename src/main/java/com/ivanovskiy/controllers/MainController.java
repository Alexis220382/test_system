package com.ivanovskiy.controllers;

import com.ivanovskiy.dao.tests.TestsEntityDAO;
import com.ivanovskiy.dao.tests.TestsEntityDAOImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class MainController {

    //At first!!!
    @RequestMapping(value = "/gettests", method = RequestMethod.GET)
    public ModelAndView getTests(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        TestsEntityDAO testsEntityDAO = new TestsEntityDAOImpl();
        HttpSession session = request.getSession();
        request.setAttribute("tests", testsEntityDAO.findAll());
        request.setAttribute("login", session.getAttribute("name"));
        request.setAttribute("auths", session.getAttribute("auths"));
        modelAndView.setViewName("start");
        return modelAndView;
    }

    @RequestMapping(value = "/getquestions", method = RequestMethod.GET)
    public ModelAndView getQuestions(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ModelAndView modelAndView = new ModelAndView();
//        TestquestionsEntityDAO testquestionsEntityDAO = new TestquestionsEntityDAOImpl();
//        ResultEntityDAO resultEntityDAO = new ResultEntityDAOImpl();
//
//        HttpSession session = request.getSession();
//        if (request.getParameter("testN") == null && session.getAttribute("testN") == null) {
//            request.setAttribute("error", "Вы ничего не выбрали.");
//            request.getRequestDispatcher("/gettests").forward(request, response);
//        }
//        if (session.getAttribute("testN") == null) {
//            session.setAttribute("testN", request.getParameter("testN"));
//        }
//        Integer tNumber = Integer.parseInt(session.getAttribute("testN").toString());
//        List<QuestionsEntity> questionslist = testquestionsEntityDAO.findAll(tNumber);
//        Integer qNumber;
//        if (request.getParameter("qNumber") == null) {
//            qNumber = 0;
//        } else {
//            qNumber = Integer.valueOf(request.getParameter("qNumber"));
//        }
//        if (request.getParameter("answer") == null && qNumber != 0) {
//            qNumber--;
//            request.setAttribute("question", questionslist.get(qNumber).getName());
//            request.setAttribute("error", "Выберети хотя бы одно значение.");
//            modelAndView.setViewName("questions");
//            return modelAndView;
//        }
//        request.setAttribute("question", questionslist.get(qNumber).getName());
//        if (request.getParameter("answer") != null) {
//            resultEntityDAO.save(
//                    testquestionsEntityDAO.findAll(tNumber).get(qNumber - 1).getId(),
//                    session.getAttribute("login").toString(),
//                    Integer.parseInt(request.getParameter("answer")));
//        }
        modelAndView.setViewName("questions");
        return modelAndView;
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public ModelAndView setResult(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
//        TestquestionsEntityDAO testquestionsEntityDAO = new TestquestionsEntityDAOImpl();
//        ResultEntityDAO resultEntityDAO = new ResultEntityDAOImpl();
//
//        HttpSession session = request.getSession();
//
//        Integer tNumber = Integer.parseInt(session.getAttribute("testN").toString());
//        Integer qNumber = testquestionsEntityDAO.findAll(tNumber).size() - 1;
//
//        resultEntityDAO.save(
//                testquestionsEntityDAO.
//                        findAll(tNumber).
//                        get(qNumber).getId(),
//                session.getAttribute("login").toString(),
//                Integer.parseInt(request.getParameter("answer")));

        modelAndView.setViewName("result");
        return modelAndView;
    }
}
