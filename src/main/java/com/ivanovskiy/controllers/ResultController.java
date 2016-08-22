package com.ivanovskiy.controllers;

import com.ivanovskiy.dao.questions.QuestionsEntityDAO;
import com.ivanovskiy.dao.result.ResultEntityDAO;
import com.ivanovskiy.dao.tests.TestsEntityDAO;
import com.ivanovskiy.entity.QuestionsEntity;
import com.ivanovskiy.entity.ResultEntity;
import com.ivanovskiy.entity.TestsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ResultController {

    @Autowired
    private QuestionsEntityDAO questionDAO;
    @Autowired
    private TestsEntityDAO testDAO;
    @Autowired
    private ResultEntityDAO resultDAO;

    @RequestMapping(value = "/gettests", method = RequestMethod.GET)
    public ModelAndView getTests(HttpServletRequest request,
                                 HttpSession session) throws ParseException {
        session.removeAttribute("testN");
        String login = String.valueOf(session.getAttribute("login"));
        List<ResultEntity> resultsAll = resultDAO.findAll();
        Set<TestsEntity> testss = new HashSet<>();
        Set<ResultEntity> results = new HashSet<>();
        for (ResultEntity result : resultsAll) {
            if (result.getLogin().equals(login))
                results.add(result);
        }
        for (ResultEntity result : results) {
            testss.add(result.getTest());
        }
        Set<String> res = new HashSet<>();
        for (ResultEntity re : results) {
            res.add(re.getTest().getName());
        }
        Date dateFrom;
        Date dateTo;
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        List<TestsEntity> tests = testDAO.findAll();
        List<TestsEntity> tes = new ArrayList<>();
        for (TestsEntity test : tests) {
            dateFrom = format.parse(test.getDateFrom());
            dateTo = format.parse(test.getDateTo());
            if (dateFrom.getTime() <= today.getTime()
                    && today.getTime() <= dateTo.getTime())
                tes.add(test);
        }
        ModelAndView modelAndView = new ModelAndView();
        if (tes.size() != 0) {
            for (TestsEntity test : testss) {
                tes.remove(test);
            }
            request.setAttribute("tests", tes);
        } else {
            request.setAttribute("noTests", "Нет доступных для сдачи тестов");
        }
        for (ResultEntity result : resultsAll) {
                if (result.getRes().equals(Integer.parseInt(result.getQuestion().getRight_answer())))
                    resultDAO.update(result.getId(), 1);
        }
        int i = 100;
        int test_count = testss.size();
        for (ResultEntity result : results) {
            if (result.getMark() == 1) i++;
        }
        i = i - test_count*15;
        request.setAttribute("testscount", test_count);
        request.setAttribute("points", i);
        request.setAttribute("login", login);
        request.setAttribute("results", res);
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
        for (int i = 1; i <= 15; i++) {
            if (request.getParameter("id" + i).equals("")) break;
            question = questionDAO.getQuestionById(Integer.parseInt(request.getParameter("id" + i)));
            test = testDAO.getTestById(Integer.parseInt(request.getParameter("testN")));
            result = new ResultEntity();
            result.setQuestion(question);
            result.setLogin(String.valueOf(session.getAttribute("login")));
            result.setRes(Integer.parseInt(request.getParameter("answer" + i)));
            result.setMark(0);
            result.setTest(test);
            result.setDatePass(date);
            resultDAO.save(result);
        }
        return "result";
    }

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/checkwithtests", method = RequestMethod.GET)
    public String testsByUser(Model model) {
        List<TestsEntity> tests = testDAO.findAll();
        Set<TestsEntity> set = new HashSet<>();
        for (TestsEntity test : tests) {
            for (QuestionsEntity question : test.getQuestions()) {
                if (question.getRight_answer().equals(""))
                    set.add(test);
            }
        }
        if (set.size() == 0) {
            model.addAttribute("message", "Непроверенные тесты отсутствуют.");
        } else {
            model.addAttribute("tests", set);
        }
        return "checktests";
    }

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/checktest", method = RequestMethod.GET)
    public String tests(Model model,
                        HttpServletRequest request,
                        HttpSession session) {
        List<ResultEntity> resultsByLoginAndTest
                = resultDAO.getAllByLoginAndTest(
                String.valueOf(session.getAttribute("user")),
                testDAO.getTestById(Integer.parseInt(request.getParameter("test"))));
        TestsEntity test = testDAO.getTestById(Integer.parseInt(request.getParameter("test")));
        model.addAttribute("resultsByLoginAndTest", resultsByLoginAndTest);
        model.addAttribute("questions", test.getQuestions());
        model.addAttribute("testN", request.getParameter("test"));
        return "checktests";
    }

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/change", method = RequestMethod.GET)
    public String change(Model model) {
        List<TestsEntity> tests = testDAO.findAll();
        model.addAttribute("tests", tests);
        return "timeperiod";
    }

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/showexisteperiod", method = RequestMethod.GET)
    public String showexisteperiod(Model model,
                                   HttpServletRequest request) {
        TestsEntity test = testDAO.getTestById(Integer.parseInt(request.getParameter("chosetest")));
        model.addAttribute("test", test);
        return "timeperiod";
    }

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/changeperiod", method = RequestMethod.GET)
    public String changeperiod(Model model,
                               HttpServletRequest request) {
        TestsEntity test = testDAO.getTestById(Integer.parseInt(request.getParameter("testId")));
        testDAO.update(
                test.getId(),
                request.getParameter("period_from"),
                request.getParameter("period_to"));
        model.addAttribute("test", testDAO.getTestById(Integer.parseInt(request.getParameter("testId"))));
        model.addAttribute("message", "Период действия теста изменен.");
        return "timeperiod";
    }

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/saverevision", method = RequestMethod.GET)
    public String saveRevision(HttpServletRequest request,
                               HttpServletResponse response) throws ServletException, IOException {
        TestsEntity test = testDAO.getTestById(Integer.parseInt(request.getParameter("testN")));
        Set<QuestionsEntity> questions = test.getQuestions();
        int i = 1;
        for (QuestionsEntity question : questions) {
            question.setRight_answer(request.getParameter("answer" + i));
            questionDAO.update(question);
            i++;
        }
        request.getRequestDispatcher("/admin/question").forward(request, response);
        return null;
    }
}
