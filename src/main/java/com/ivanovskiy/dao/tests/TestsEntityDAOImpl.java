package com.ivanovskiy.dao.tests;

import com.ivanovskiy.dao.ManageSessionFactory;
import com.ivanovskiy.entity.TestsEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import javax.swing.*;
import java.util.List;

public class TestsEntityDAOImpl implements TestsEntityDAO {

    public List<TestsEntity> findAll() {
        Session session = null;
        List<TestsEntity> testsEntities = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            Criteria criteria = session.createCriteria(TestsEntity.class);
            testsEntities = criteria.list();

            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
        return testsEntities;
    }

    @Override
    public TestsEntity getTestByName(String name) {
        Session session = null;
        TestsEntity test = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            Criteria criteria = session.createCriteria(TestsEntity.class);
            criteria.add(Restrictions.eq("name", name));
            test = (TestsEntity) criteria.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return test;
    }

    public TestsEntity save(TestsEntity testsEntity) {
        Session session = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.save(testsEntity);
            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при сохранении в базу данных", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return testsEntity;
    }

    public TestsEntity update(int id, String name) {
        Session session = null;
        TestsEntity testsEntities = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            testsEntities.setId(id);
            testsEntities.setName(name);
            session.update(testsEntities);

            tx.commit();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при сохранении в базу данных", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {

                session.close();
            }
        }
        return testsEntities;
    }

    public void delete(TestsEntity testsEntity) {
//        Session session = null;
//        try {
//            session = ManageSessionFactory.getFactory().openSession();
//            Transaction tx = session.beginTransaction();
//
//            session.delete(testsEntity);
//
//            tx.commit();
//        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при удалении из базы данных", JOptionPane.OK_OPTION);
//        } finally {
//            if (session != null && session.isOpen()) {
//
//                session.close();
//            }
//        }
    }
}
