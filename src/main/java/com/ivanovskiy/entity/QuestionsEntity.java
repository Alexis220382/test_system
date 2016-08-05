package com.ivanovskiy.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by B50-30 on 10.11.2015.
 */
@Entity
@Table(name = "questions", schema = "", catalog = "test_db")
public class QuestionsEntity {

    private TestsEntity test;

    @ManyToOne
    @JoinColumn(name = "id_tests")
    public TestsEntity getTest() {
        return this.test;
    }

    public void setTest(TestsEntity test) {
        this.test = test;
    }

    private Set<ResultEntity> resultEntitySet = new HashSet<ResultEntity>();

    @OneToMany(mappedBy = "questions", cascade = CascadeType.ALL, orphanRemoval = true)
    public Set<ResultEntity> getResultEntitySet() {
        return this.resultEntitySet;
    }

    public void setResultEntitySet(Set<ResultEntity> resultEntitySet) {
        this.resultEntitySet = resultEntitySet;
    }

    private int id;
    private int id_tests;
    private String name;

    public QuestionsEntity(int id, int id_tests, String name) {
        this.id = id;
        this.id_tests = id_tests;
        this.name = name;
    }

    public QuestionsEntity() {
    }

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = true, insertable = true, updatable = true, length = 1000)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "id_tests", nullable = true, insertable = true, updatable = true)
    public int getId_tests() {
        return id_tests;
    }

    public void setId_tests(int id_tests) {
        this.id_tests = id_tests;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QuestionsEntity that = (QuestionsEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
