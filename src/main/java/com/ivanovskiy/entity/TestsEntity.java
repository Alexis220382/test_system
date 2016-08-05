package com.ivanovskiy.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by B50-30 on 10.11.2015.
 */
@Entity
@Table(name = "tests", schema = "", catalog = "test_db")
public class TestsEntity {

    private Set<QuestionsEntity> questionsEntitySet = new HashSet<QuestionsEntity>();

    @OneToMany(mappedBy = "test", cascade = CascadeType.ALL, orphanRemoval = true)
    public Set<QuestionsEntity> getQuestionsEntitySet() {
        return this.questionsEntitySet;
    }

    public void setQuestionsEntitySet(Set<QuestionsEntity> questionsEntitySet) {
        this.questionsEntitySet = questionsEntitySet;
    }

    private int id;
    private String name;

    public TestsEntity(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public TestsEntity() {
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
    @Column(name = "name", nullable = true, insertable = true, updatable = true, length = 255)
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

        TestsEntity that = (TestsEntity) o;

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
