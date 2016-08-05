package com.ivanovskiy.dao.questions;

import com.ivanovskiy.dao.ManageSessionFactory;
import com.ivanovskiy.entity.QuestionsEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.swing.*;
import java.util.List;

public class QuestionsEntityDAOImpl implements QuestionsEntityDAO {

    public List<QuestionsEntity> findAll(int testN) {
        Session session = null;
        List<QuestionsEntity> questionsEntities = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            questionsEntities = session.createSQLQuery("SELECT * FROM questions WHERE id_tests="+testN)
                    .addEntity(QuestionsEntity.class).list();

            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return questionsEntities;
    }

    public QuestionsEntity add(QuestionsEntity testsEntity) {
        return null;
    }

    public QuestionsEntity save(QuestionsEntity testsEntity) {
        return null;
    }

    public void delete(QuestionsEntity testsEntity) {

    }
}
