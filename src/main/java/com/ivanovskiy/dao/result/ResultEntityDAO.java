package com.ivanovskiy.dao.result;

import com.ivanovskiy.entity.ResultEntity;

import java.util.List;

public interface ResultEntityDAO {

    List<ResultEntity> findAll();

    ResultEntity save(ResultEntity result);

    void delete(ResultEntity result);
}
