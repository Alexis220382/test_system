package com.ivanovskiy.dao.result;

import com.ivanovskiy.entity.ResultEntity;

import java.util.List;

public class ResultEntityDAOImpl implements ResultEntityDAO {

    public List<ResultEntity> findAll() {
        return null;
    }

    public ResultEntity add(int id_questions, String login, int res) {
//        Session session = null;
//        try {
//            session = ManageSessionFactory.getFactory().openSession();
//            Transaction tx = session.beginTransaction();
//
//            ResultEntity resultEntity = new ResultEntity();
//            resultEntity.setId_testquestions(id_questions);
//            resultEntity.setLogin(login);
//            resultEntity.setRes(res);
//            session.save(resultEntity);
//            tx.commit();
//        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при вставке", JOptionPane.OK_OPTION);
//        } finally {
//            if (session != null && session.isOpen()) {
//
//                session.close();
//            }
//        }
        return null;
    }

    public ResultEntity save(ResultEntity resultEntity) {
        return null;
    }

    public void delete(ResultEntity resultEntity) {

    }
}
