package com.ivanovskiy.dao.questions;

import com.ivanovskiy.entity.QuestionsEntity;

import java.util.List;

/**
 * Created by B50-30 on 08.11.2015.
 */
public interface QuestionsEntityDAO {

    // ����� ��� ������� � ������� ����� ?.
    public List<QuestionsEntity> findAll(int testN);

    // �������� ������.
    public QuestionsEntity add(QuestionsEntity testsEntity);

    // �������� ������.
    public QuestionsEntity save(QuestionsEntity testsEntity);

    // ������� ������.
    public void delete(QuestionsEntity testsEntity);
}
