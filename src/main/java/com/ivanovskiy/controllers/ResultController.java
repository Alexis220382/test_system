package com.ivanovskiy.controllers;

import com.ivanovskiy.dao.result.ResultEntityDAO;
import com.ivanovskiy.dao.result.ResultEntityDAOImpl;
import com.ivanovskiy.dao.tests.TestsEntityDAO;
import com.ivanovskiy.dao.tests.TestsEntityDAOImpl;
import com.ivanovskiy.entity.QuestionsEntity;
import com.ivanovskiy.entity.ResultEntity;
import com.ivanovskiy.entity.TestsEntity;
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
public class ResultController {

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
    public String getQuestions(HttpServletRequest request,
                               HttpServletResponse response,
                               HttpSession session) throws IOException, ServletException {
        TestsEntityDAO testsDAO = new TestsEntityDAOImpl();
        TestsEntity test;

        if (request.getParameter("testN") == null && session.getAttribute("testN") == null) {
            request.setAttribute("error", "Вы ничего не выбрали.");
            request.getRequestDispatcher("/gettests").forward(request, response);
        }
        if (session.getAttribute("testN") == null) {
            session.setAttribute("testN", request.getParameter("testN"));
        }
        test = testsDAO.getTestById(Integer.parseInt(request.getParameter("testN")));
        int i = 1;
        for (QuestionsEntity question : test.getQuestions()) {
            request.setAttribute("qName"+i, question.getName());
            request.setAttribute("first_answer"+i, question.getFirst());
            request.setAttribute("second_answer"+i, question.getSecond());
            request.setAttribute("third_answer"+i, question.getThird());
            i++;
        }
        return "questions";
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public String setResult(HttpServletRequest request, HttpSession session) {
        ResultEntityDAO resultDAO = new ResultEntityDAOImpl();

        ResultEntity result;
        for (int i = 1; i <=15 ; i++) {
            result = new ResultEntity();
            result.setIdTest(Integer.parseInt(request.getParameter("testN")));
            result.setIdQuestion(Integer.parseInt(request.getParameter("qName" + i)));
            result.setLogin(String.valueOf(session.getAttribute("login")));
            result.setRes(Integer.parseInt(request.getParameter("answer"+i)));
            //Дату не забыть
            resultDAO.save(result);
        }
        return "result";
    }
}
