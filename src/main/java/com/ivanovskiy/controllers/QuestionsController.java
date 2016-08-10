package com.ivanovskiy.controllers;

import com.ivanovskiy.dao.questions.QuestionsEntityDAO;
import com.ivanovskiy.dao.questions.QuestionsEntityDAOImpl;
import com.ivanovskiy.dao.tests.TestsEntityDAO;
import com.ivanovskiy.dao.tests.TestsEntityDAOImpl;
import com.ivanovskiy.entity.QuestionsEntity;
import com.ivanovskiy.entity.TestsEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashSet;
import java.util.List;

/**
 * Created by Alexey-Ivanovskiy on 07.08.2016.
 */
@Controller
public class QuestionsController {

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/question", method = RequestMethod.GET)
    public String getQuestions(ModelMap model) {
        QuestionsEntityDAO questionsDAO = new QuestionsEntityDAOImpl();
        model.addAttribute("questions", questionsDAO.findAll());
        return "adminpanel";
    }

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/newquestion", method = RequestMethod.GET)
    public void newQuestion(ModelMap model,
                            HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionsEntityDAO questionsDAO = new QuestionsEntityDAOImpl();
        List<QuestionsEntity> questions = questionsDAO.findAll();
        model.addAttribute("questions", questions);
        for (QuestionsEntity ques : questions) {
            if (request.getParameter("new_question").equals(ques.getName())) {
                request.setAttribute("message", "Такой вопрос уже есть в базе.");
                request.getRequestDispatcher("/admin/question").forward(request, response);
                return;
            }
        }
        QuestionsEntity question = new QuestionsEntity();
        question.setName(request.getParameter("new_question"));
        question.setFirst(request.getParameter("first_variant"));
        question.setSecond(request.getParameter("second_variant"));
        question.setThird(request.getParameter("third_variant"));

        questionsDAO.save(question);
        request.setAttribute("message", "Вопрос успешно добавлен.");
        request.getRequestDispatcher("/admin/question").forward(request, response);
        return;
    }

    @PreAuthorize(value = "ROLE_ADMIN")
    @RequestMapping(value = "admin/newtest", method = RequestMethod.GET)
    public void newTest(HttpServletRequest request, HttpServletResponse response)
            throws ParseException, ServletException, IOException {

        TestsEntityDAO testsDAO = new TestsEntityDAOImpl();
        QuestionsEntityDAO questionsDAO = new QuestionsEntityDAOImpl();

        TestsEntity test = new TestsEntity();
        QuestionsEntity question = new QuestionsEntity();

        HashSet<TestsEntity> tests = new HashSet<>();
        HashSet<QuestionsEntity> questions = new HashSet<>();
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("one"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("one"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("two"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("three"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("four"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("five"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("six"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("seven"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("eight"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("nine"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("ten"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("eleven"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("twelve"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("thirteen"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("fourteen"))));
        questions.add(questionsDAO.getQuestionById(Integer.parseInt(request.getParameter("fifteen"))));

        test.setName(request.getParameter("test_name"));
        test.setDateFrom(request.getParameter("period_from"));
        test.setDateTo(request.getParameter("period_to"));
        test.setQuestions(questions);
        test = testsDAO.save(test);

        request.getRequestDispatcher("/admin/question").forward(request, response);
        return;
    }
}
