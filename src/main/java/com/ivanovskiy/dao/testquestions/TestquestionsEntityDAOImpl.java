//package com.ivanovskiy.dao.testquestions;
//
//import com.ivanovskiy.dao.ManageSessionFactory;
//import com.ivanovskiy.entity.TestquestionsEntity;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
//import javax.swing.*;
//import java.util.List;
//
//public class TestquestionsEntityDAOImpl implements TestquestionsEntityDAO {
//
//    public List<TestquestionsEntity> findAll(int testN) {
//        Session session = null;
//        List<TestquestionsEntity> testquestionsEntities = null;
////        try {
////            session = ManageSessionFactory.getFactory().openSession();
////            Transaction tx = session.beginTransaction();
////
////            testquestionsEntities = session.createSQLQuery("SELECT * FROM testquestions WHERE id_tests="+testN)
////                    .addEntity(QuestionsEntity.class).list();
////
////            tx.commit();
////        } catch (Exception e) {
////            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
////        } finally {
////            if (session != null && session.isOpen()) {
////                session.close();
////            }
////        }
//        return testquestionsEntities;
//    }
//
//    public TestquestionsEntity save(TestquestionsEntity testquestions) {
//        Session session = null;
//        try {
//            session = ManageSessionFactory.getFactory().openSession();
//            Transaction tx = session.beginTransaction();
//            session.save(testquestions);
//            tx.commit();
//        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, e.getMessage(), "Ошибка при выборке", JOptionPane.OK_OPTION);
//        } finally {
//            if (session != null && session.isOpen()) {
//                session.close();
//            }
//        }
//        return testquestions;
//    }
//
//    public void delete(TestquestionsEntity testsEntity) {
//
//    }
//}
