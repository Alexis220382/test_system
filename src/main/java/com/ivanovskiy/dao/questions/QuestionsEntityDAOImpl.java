package com.ivanovskiy.dao.questions;

import com.ivanovskiy.dao.ManageSessionFactory;
import com.ivanovskiy.entity.QuestionsEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.swing.*;
import java.util.List;

/**
 * Created by Alexey-Ivanovskiy on 07.08.2016.
 */
public class QuestionsEntityDAOImpl implements QuestionsEntityDAO {
    @Override
    public List<QuestionsEntity> findAll() {
        Session session = null;
        List<QuestionsEntity> questions = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            Criteria criteria = session.createCriteria(QuestionsEntity.class);
            questions = criteria.list();

            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return questions;
    }

    @Override
    public QuestionsEntity getQuestionById(int id) {
        Session session = null;
        QuestionsEntity question = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            question = (QuestionsEntity) session.createQuery("FROM QuestionsEntity WHERE id=" + id).list().get(0);
            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return question;
    }

    @Override
    public QuestionsEntity save(QuestionsEntity question) {
        Session session = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.save(question);
            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return question;
    }

    @Override
    public QuestionsEntity update(QuestionsEntity question) {
        Session session = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.update(question);
            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return question;
    }
}
