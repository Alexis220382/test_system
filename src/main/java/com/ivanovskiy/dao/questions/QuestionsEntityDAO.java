package com.ivanovskiy.dao.questions;

import com.ivanovskiy.entity.QuestionsEntity;

import java.util.List;

/**
 * Created by Alexey-Ivanovskiy on 07.08.2016.
 */
public interface QuestionsEntityDAO {

    // Найти все вопросы с номером теста ?.
    List<QuestionsEntity> findAll();

    // Найти все вопросы с номером теста ?.
    QuestionsEntity getQuestionById(int id);

    // Добавить вопрос.
    QuestionsEntity save(QuestionsEntity question);

    QuestionsEntity update(QuestionsEntity question);

}
