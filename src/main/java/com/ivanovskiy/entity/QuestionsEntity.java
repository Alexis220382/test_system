package com.ivanovskiy.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Alexey-Ivanovskiy on 07.08.2016.
 */
@Entity
@Table(name = "questions", schema = "", catalog = "test_db")
public class QuestionsEntity {

    private Set<TestsEntity> tests = new HashSet<>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "testquestions",
            //foreign key for CarsEntity in employee_car table
            joinColumns = @JoinColumn(name = "id_questions"),
            //foreign key for other side
            inverseJoinColumns = @JoinColumn(name = "id_tests"))
    public Set<TestsEntity> getTestsEntity () {
        return tests;
    }

    public void setTestsEntity(Set<TestsEntity> tests) {
        this.tests = tests;
    }

    public void addTestsEntity(TestsEntity test) {
        tests.add(test);
    }

    private int id;
    private String name;
    private String first;
    private String second;
    private String third;

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
    @Column(name = "first", nullable = true, insertable = true, updatable = true, length = 1000)
    public String getFirst() {
        return first;
    }

    public void setFirst(String first) {
        this.first = first;
    }

    @Basic
    @Column(name = "second", nullable = true, insertable = true, updatable = true, length = 1000)
    public String getSecond() {
        return second;
    }

    public void setSecond(String second) {
        this.second = second;
    }

    @Basic
    @Column(name = "third", nullable = true, insertable = true, updatable = true, length = 1000)
    public String getThird() {
        return third;
    }

    public void setThird(String third) {
        this.third = third;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QuestionsEntity that = (QuestionsEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (first != null ? !first.equals(that.first) : that.first != null) return false;
        if (second != null ? !second.equals(that.second) : that.second != null) return false;
        if (third != null ? !third.equals(that.third) : that.third != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (first != null ? first.hashCode() : 0);
        result = 31 * result + (second != null ? second.hashCode() : 0);
        result = 31 * result + (third != null ? third.hashCode() : 0);
        return result;
    }
}
