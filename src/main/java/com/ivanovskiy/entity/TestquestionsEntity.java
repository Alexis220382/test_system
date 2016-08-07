package com.ivanovskiy.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Alexey-Ivanovskiy on 07.08.2016.
 */
@Entity
@Table(name = "testquestions", schema = "", catalog = "test_db")
public class TestquestionsEntity {

//    private QuestionsEntity questions;
//
//    @ManyToOne
//    @JoinColumn(name = "id_questions")
//    public QuestionsEntity getQuestionsEntity() {
//        return this.questions;
//    }
//
//    public void setQuestionsEntity(QuestionsEntity questions) {
//        this.questions = questions;
//    }
//
//    private TestsEntity tests;
//
//    @ManyToOne
//    @JoinColumn(name = "id_tests")
//    public TestsEntity getTestsEntity() {
//        return this.tests;
//    }
//
//    public void setTestsEntity(TestsEntity tests) {
//        this.tests = tests;
//    }

    private Set<ResultEntity> resultEntities = new HashSet<>();

    @OneToMany(mappedBy = "testquestionsEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    public Set<ResultEntity> getResultEntity() {
        return this.resultEntities;
    }

    public void setResultEntity(Set<ResultEntity> resultEntities) {
        this.resultEntities = resultEntities;
    }

    private int id;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TestquestionsEntity that = (TestquestionsEntity) o;

        if (id != that.id) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id;
    }
}
