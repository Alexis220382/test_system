package com.ivanovskiy.dao.tests;

import com.ivanovskiy.entity.TestsEntity;

import java.util.List;

public interface TestsEntityDAO {

    List<TestsEntity> findAll();

    TestsEntity getTestByName(String name);

    TestsEntity save(TestsEntity testsEntity);

    TestsEntity update(int id, String name);

    void delete(TestsEntity testsEntity);
}
