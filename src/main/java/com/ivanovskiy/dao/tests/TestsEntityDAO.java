package com.ivanovskiy.dao.tests;

import com.ivanovskiy.entity.TestsEntity;

import java.util.List;

public interface TestsEntityDAO {

    List<TestsEntity> findAll();

    TestsEntity getTestById(int id);

    TestsEntity save(TestsEntity testsEntity);

    TestsEntity update(int id, String dateFrom, String dateTo);

    void delete(TestsEntity testsEntity);
}
