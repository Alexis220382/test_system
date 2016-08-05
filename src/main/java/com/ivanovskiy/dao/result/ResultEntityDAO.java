package com.ivanovskiy.dao.result;

import com.ivanovskiy.entity.ResultEntity;

import java.util.List;

public interface ResultEntityDAO {

    // Найти все результаты.
    public List<ResultEntity> findAll();

    // Добавить результат.
    public ResultEntity add(int id_questions, String login, String name);

    // Обновить результат.
    public ResultEntity save(ResultEntity resultEntity);

    // Удалить результат.
    public void delete(ResultEntity resultEntity);
}
