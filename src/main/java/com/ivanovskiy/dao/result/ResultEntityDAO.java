package com.ivanovskiy.dao.result;

import com.ivanovskiy.entity.ResultEntity;
import com.ivanovskiy.entity.TestsEntity;

import java.util.List;

public interface ResultEntityDAO {

    List<ResultEntity> findAll();

    List<ResultEntity> getAllByLogin(String user);

    List<ResultEntity> getAllByTest(TestsEntity test);

    List<ResultEntity> getAllByLoginAndTest(String user, TestsEntity test);

    ResultEntity save(ResultEntity result);

    ResultEntity update(int id, int mark);

    void delete(ResultEntity result);

}
