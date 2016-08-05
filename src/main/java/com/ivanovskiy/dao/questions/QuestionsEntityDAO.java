package com.ivanovskiy.dao.questions;

import com.ivanovskiy.entity.QuestionsEntity;

import java.util.List;

/**
 * Created by B50-30 on 08.11.2015.
 */
public interface QuestionsEntityDAO {

    // Найти все вопросы с номером теста ?.
    public List<QuestionsEntity> findAll(int testN);

    // Добавить вопрос.
    public QuestionsEntity add(QuestionsEntity testsEntity);

    // Обновить вопрос.
    public QuestionsEntity save(QuestionsEntity testsEntity);

    // Удалить вопрос.
    public void delete(QuestionsEntity testsEntity);
}
