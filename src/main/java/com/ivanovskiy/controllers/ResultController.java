package com.ivanovskiy.controllers;

import com.ivanovskiy.dao.questions.QuestionsEntityDAO;
import com.ivanovskiy.dao.result.ResultEntityDAO;
import com.ivanovskiy.dao.tests.TestsEntityDAO;
import com.ivanovskiy.entity.QuestionsEntity;
import com.ivanovskiy.entity.ResultEntity;
import com.ivanovskiy.entity.TestsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Controller
public class ResultController {

    @Autowired
    private QuestionsEntityDAO questionDAO;
    @Autowired
    private TestsEntityDAO testDAO;
    @Autowired
    private ResultEntityDAO resultDAO;

    @RequestMapping(value = "/gettests", method = RequestMethod.GET)
    public ModelAndView getTests(HttpServletRequest request, HttpSession session) {
        session.removeAttribute("testN");
        ModelAndView modelAndView = new ModelAndView();
        request.setAttribute("tests", testDAO.findAll());
        request.setAttribute("login", session.getAttribute("name"));
        modelAndView.setViewName("start");
        return modelAndView;
    }

    @RequestMapping(value = "/getquestions", method = RequestMethod.GET)
    public String getQuestions(HttpServletRequest request,
                               HttpServletResponse response,
                               HttpSession session) throws IOException, ServletException {
        TestsEntity test;

        if (request.getParameter("testN") == null && session.getAttribute("testN") == null) {
            request.setAttribute("error", "Вы ничего не выбрали.");
            request.getRequestDispatcher("/gettests").forward(request, response);
        }
        if (session.getAttribute("testN") == null || session.getAttribute("testN").equals("")) {
            session.setAttribute("testN", request.getParameter("testN"));
        }
        test = testDAO.getTestById(Integer.parseInt(request.getParameter("testN")));
        int i = 1;
        for (QuestionsEntity question : test.getQuestions()) {
            request.setAttribute("qName" + i, question.getName());
            request.setAttribute("first_answer" + i, question.getFirst());
            request.setAttribute("second_answer" + i, question.getSecond());
            request.setAttribute("third_answer" + i, question.getThird());
            request.setAttribute("questionId" + i, question.getId());
            i++;
        }
        return "questions";
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public String setResult(HttpServletRequest request, HttpSession session) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        String date = format.format(today);
        QuestionsEntity question;
        TestsEntity test;

        ResultEntity result;
        for (int i = 1; i < 15; i++) {
            if (request.getParameter("id" + i).equals("")) break;
            question = questionDAO.getQuestionById(Integer.parseInt(request.getParameter("id"+i)));
            test = testDAO.getTestById(Integer.parseInt(request.getParameter("testN")));
            result = new ResultEntity();
            result.setQuestion(question);
            result.setLogin(String.valueOf(session.getAttribute("login")));
            result.setRes(Integer.parseInt(request.getParameter("answer" + i)));
            result.setTest(test);
            result.setDatePass(date);
            resultDAO.save(result);
        }
        return "result";
    }

}
