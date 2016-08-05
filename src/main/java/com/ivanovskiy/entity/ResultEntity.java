package com.ivanovskiy.entity;

import javax.persistence.*;

/**
 * Created by B50-30 on 10.11.2015.
 */
@Entity
@Table(name = "result", schema = "", catalog = "test_db")
public class ResultEntity {

    private QuestionsEntity questions;

    @ManyToOne
    @JoinColumn(name = "id_questions")
    public QuestionsEntity getQuestions() {
        return this.questions;
    }

    public void setQuestions(QuestionsEntity questions) {
        this.questions = questions;
    }

    private int id;
    private int id_questions;
    private String login;
    private String name;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "id_questions", nullable = true, insertable = true, updatable = true)
    public int getId_questions() {
        return id_questions;
    }

    public void setId_questions(int id_questions) {
        this.id_questions = id_questions;
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
    @Column(name = "name", nullable = true, insertable = true, updatable = true, length = 55)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ResultEntity that = (ResultEntity) o;

        if (id != that.id) return false;
        if (login != null ? !login.equals(that.login) : that.login != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (login != null ? login.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
