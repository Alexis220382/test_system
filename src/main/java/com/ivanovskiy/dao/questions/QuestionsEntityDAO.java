package com.ivanovskiy.dao.questions;

import com.ivanovskiy.entity.QuestionsEntity;

import java.util.List;

/**
 * Created by Alexey-Ivanovskiy on 07.08.2016.
 */
public interface QuestionsEntityDAO {

    List<QuestionsEntity> findAll();

    QuestionsEntity getQuestionById(int id);

    QuestionsEntity save(QuestionsEntity question);

    QuestionsEntity update(QuestionsEntity question);

}
