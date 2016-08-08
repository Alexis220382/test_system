package com.ivanovskiy.entity;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Alexey-Ivanovskiy on 08.08.2016.
 */
@Entity
@Table(name = "result", schema = "", catalog = "test_db")
public class ResultEntity {
    private int id;
    private Integer idTest;
    private Integer idQuestion;
    private String login;
    private Integer res;
    private String datePass;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "id_test", nullable = true, insertable = true, updatable = true)
    public Integer getIdTest() {
        return idTest;
    }

    public void setIdTest(Integer idTest) {
        this.idTest = idTest;
    }

    @Basic
    @Column(name = "id_question", nullable = true, insertable = true, updatable = true)
    public Integer getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(Integer idQuestion) {
        this.idQuestion = idQuestion;
    }

    @Basic
    @Column(name = "login", nullable = true, insertable = true, updatable = true, length = 55)
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    @Basic
    @Column(name = "res", nullable = true, insertable = true, updatable = true)
    public Integer getRes() {
        return res;
    }

    public void setRes(Integer res) {
        this.res = res;
    }

    @Basic
    @Column(name = "date_pass", nullable = true, insertable = true, updatable = true, length = 25)
    public String getDatePass() {
        return datePass;
    }

    public void setDatePass(String datePass) {
        this.datePass = datePass;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResultEntity that = (ResultEntity) o;

        if (id != that.id) return false;
        if (idTest != null ? !idTest.equals(that.idTest) : that.idTest != null) return false;
        if (idQuestion != null ? !idQuestion.equals(that.idQuestion) : that.idQuestion != null) return false;
        if (login != null ? !login.equals(that.login) : that.login != null) return false;
        if (res != null ? !res.equals(that.res) : that.res != null) return false;
        if (datePass != null ? !datePass.equals(that.datePass) : that.datePass != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (idTest != null ? idTest.hashCode() : 0);
        result = 31 * result + (idQuestion != null ? idQuestion.hashCode() : 0);
        result = 31 * result + (login != null ? login.hashCode() : 0);
        result = 31 * result + (res != null ? res.hashCode() : 0);
        result = 31 * result + (datePass != null ? datePass.hashCode() : 0);
        return result;
    }

    private Set<QuestionsEntity> questions;

    public Set<QuestionsEntity> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<QuestionsEntity> questions) {
        this.questions = questions;
    }

}
