package com.ivanovskiy.dao.tests;

import com.ivanovskiy.entity.TestsEntity;

import java.util.List;

public interface TestsEntityDAO {

    // Найти все тесты.
    public List<TestsEntity> findAll();

    // Добавить тесты.
    public TestsEntity add(TestsEntity testsEntity);

    // Обновить тесты.
    public TestsEntity update(int id, String name);

    // Удалить тест.
    public void delete(TestsEntity testsEntity);
}
