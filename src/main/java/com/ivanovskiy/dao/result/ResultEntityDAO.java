package com.ivanovskiy.dao.result;

import com.ivanovskiy.entity.ResultEntity;

import java.util.List;

public interface ResultEntityDAO {

    // ����� ��� ����������.
    public List<ResultEntity> findAll();

    // �������� ���������.
    public ResultEntity add(int id_questions, String login, String name);

    // �������� ���������.
    public ResultEntity save(ResultEntity resultEntity);

    // ������� ���������.
    public void delete(ResultEntity resultEntity);
}
