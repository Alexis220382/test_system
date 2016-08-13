package com.ivanovskiy.dao.tests;

import com.ivanovskiy.dao.ManageSessionFactory;
import com.ivanovskiy.entity.TestsEntity;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import javax.swing.*;
import java.util.List;

/**
 * Created by Alexey-Ivanovskiy on 07.08.2016.
 */
@Component
public class TestsEntityDAOImpl implements TestsEntityDAO {

    @Override
    public List<TestsEntity> findAll() {
        Session session = null;
        Transaction tx = null;
        List<TestsEntity> tests = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(TestsEntity.class);
            tests = criteria.list();
            tx.commit();
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
        return tests;
    }

    @Override
    public TestsEntity getTestById(int id) {
        Session session = null;
        Transaction tx = null;
        TestsEntity test = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            tx = session.beginTransaction();
            test = (TestsEntity) session.load(TestsEntity.class, id);
            Hibernate.initialize(test);
            tx.commit();
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return test;
    }

    @Override
    public TestsEntity save(TestsEntity testsEntity) {
        Session session = null;
        Transaction tx = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            tx = session.beginTransaction();
            session.save(testsEntity);
            tx.commit();
            session.flush();
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при сохранении в базу данных", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return testsEntity;
    }

    @Override
    public TestsEntity update(int id, String dateFrom, String dateTo) {
        Session session = null;
        Transaction tx = null;
        TestsEntity test = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(TestsEntity.class);
            criteria.add(Restrictions.eq("id", id));
            test = (TestsEntity) criteria.uniqueResult();
            test.setDateFrom(dateFrom);
            test.setDateTo(dateTo);
            session.saveOrUpdate(test);
            tx.commit();
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при сохранении в базу данных", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return test;
    }

    @Override
    public void delete(TestsEntity testsEntity) {
    }
}
