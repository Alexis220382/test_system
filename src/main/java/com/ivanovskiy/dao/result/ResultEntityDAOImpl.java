package com.ivanovskiy.dao.result;

import com.ivanovskiy.dao.ManageSessionFactory;
import com.ivanovskiy.entity.ResultEntity;
import org.hibernate.Criteria;
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
public class ResultEntityDAOImpl implements ResultEntityDAO {

    @Override
    public List<ResultEntity> findAll() {
        Session session = null;
        Transaction tx = null;
        List<ResultEntity> results = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(ResultEntity.class);
            results = criteria.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return results;
    }

    @Override
    public List<ResultEntity> getAllByLogin(String user) {
        Session session = null;
        Transaction tx = null;
        List<ResultEntity> results = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(ResultEntity.class)
                    .add(Restrictions.eq("login", user));
            results = criteria.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return results;
    }

    @Override
    public ResultEntity save(ResultEntity result) {
        Session session = null;
        Transaction tx = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            tx = session.beginTransaction();
            session.save(result);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return result;
    }

    @Override
    public void delete(ResultEntity resultEntity) {

    }

}
