package com.ivanovskiy.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Alexey-Ivanovskiy on 07.08.2016.
 */
@Entity
@Table(name = "tests", schema = "", catalog = "test_db")
public class TestsEntity {

    private Set<QuestionsEntity> questions = new HashSet<>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "testquestions",
            //foreign key
            joinColumns = @JoinColumn(name = "id_tests"),
            //foreign key for other side
            inverseJoinColumns = @JoinColumn(name = "id_questions"))
    public Set<QuestionsEntity> getQuestionsEntity () {
        return questions;
    }

    public void setQuestionsEntity(Set<QuestionsEntity> questions) {
        this.questions = questions;
    }

    public void addQuestionsEntity(QuestionsEntity question) {
        questions.add(question);
    }


    private int id;
    private String name;
    private String dateFrom;
    private String dateTo;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = true, insertable = true, updatable = true, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "date_from", nullable = false, insertable = true, updatable = true)
    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    @Basic
    @Column(name = "date_to", nullable = false, insertable = true, updatable = true)
    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        this.dateTo = dateTo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TestsEntity that = (TestsEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (dateFrom != null ? !dateFrom.equals(that.dateFrom) : that.dateFrom != null) return false;
        if (dateTo != null ? !dateTo.equals(that.dateTo) : that.dateTo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (dateFrom != null ? dateFrom.hashCode() : 0);
        result = 31 * result + (dateTo != null ? dateTo.hashCode() : 0);
        return result;
    }
}
