package com.ivanovskiy.dao.result;

import com.ivanovskiy.dao.ManageSessionFactory;
import com.ivanovskiy.entity.ResultEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.swing.*;
import java.util.List;

public class ResultEntityDAOImpl implements ResultEntityDAO {

    public List<ResultEntity> findAll() {
        return null;
    }

    public ResultEntity save(ResultEntity result) {
        Session session = null;
        Transaction tx = null;
        try {
            session = ManageSessionFactory.getFactory().openSession();
            tx = session.beginTransaction();
            session.save(result);
            tx.commit();
        } catch (Exception e) {
            if (tx!=null) tx.rollback();
            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return result;
    }

    public void delete(ResultEntity resultEntity) {

    }
}
