package com.ivanovskiy.dao.tests;

import com.ivanovskiy.entity.TestsEntity;

import java.util.List;

public interface TestsEntityDAO {

    // ����� ��� �����.
    public List<TestsEntity> findAll();

    // �������� �����.
    public TestsEntity add(TestsEntity testsEntity);

    // �������� �����.
    public TestsEntity update(int id, String name);

    // ������� ����.
    public void delete(TestsEntity testsEntity);
}
