package com.ivanovskiy.controllers;

import com.ivanovskiy.dao.questions.QuestionsEntityDAOImpl;
import com.ivanovskiy.dao.result.ResultEntityDAOImpl;
import com.ivanovskiy.dao.tests.TestsEntityDAOImpl;
import com.ivanovskiy.entity.QuestionsEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    @RequestMapping(value = "/gettests", method = RequestMethod.GET)
    public ModelAndView getTests(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        TestsEntityDAOImpl testsEntityDAO = new TestsEntityDAOImpl();

        request.setAttribute("tests", testsEntityDAO.findAll());

        modelAndView.setViewName("start");
        return modelAndView;
    }

    @RequestMapping(value = "/getsess", method = RequestMethod.GET)
    public ModelAndView getSess(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        session.setAttribute("testN", request.getParameter("testN"));
        session.setAttribute("login", request.getParameter("login"));

        modelAndView.setViewName("transit");
        return modelAndView;
    }

    @RequestMapping(value = "/getquestions", method = RequestMethod.GET)
    public ModelAndView getQuestions(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        QuestionsEntityDAOImpl questionsEntityDAO = new QuestionsEntityDAOImpl();
        ResultEntityDAOImpl resultEntityDAO = new ResultEntityDAOImpl();

        HttpSession session = request.getSession();

        Integer tNumber = Integer.parseInt(session.getAttribute("testN").toString());
        List<QuestionsEntity> questionslist = questionsEntityDAO.findAll(tNumber);

        Integer qNumber;
        if (request.getParameter("qNumber") == null) {
            qNumber = 0;
        } else {
            qNumber = Integer.valueOf(request.getParameter("qNumber"));
        }

        request.setAttribute("question", questionslist.get(qNumber).getName());

        if (request.getParameter("answer") == null) {

        } else {
            resultEntityDAO.add(
                    questionsEntityDAO.findAll(tNumber).get(qNumber - 1).getId(),
                    session.getAttribute("login").toString(),
                    request.getParameter("answer"));
        }
        modelAndView.setViewName("questions");
        return modelAndView;
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public ModelAndView setResult(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        QuestionsEntityDAOImpl questionsEntityDAO = new QuestionsEntityDAOImpl();
        ResultEntityDAOImpl resultEntityDAO = new ResultEntityDAOImpl();

        HttpSession session = request.getSession();

//        Integer qNumber = Integer.valueOf(request.getParameter("qNumber"));
        Integer tNumber = Integer.parseInt(session.getAttribute("testN").toString());
        Integer qNumber = questionsEntityDAO.findAll(tNumber).size() - 1;

        resultEntityDAO.add(
                questionsEntityDAO.
                        findAll(tNumber).
                        get(qNumber).getId(),
                session.getAttribute("login").toString(),
                request.getParameter("answer"));

        modelAndView.setViewName("result");
        return modelAndView;
    }
}
