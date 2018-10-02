package com.pkb.payment.model.service;

import java.sql.Connection;

import com.pkb.payment.model.dao.PaymentDao;
import com.pkb.payment.model.dao.PaymentDao2;
import com.pkb.payment.model.vo.Payment;

import static com.pkb.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import com.pkb.payment.model.vo.CyberMoney;

import com.pkb.payment.model.vo.PayHistory;
import com.pkb.payment.model.vo.Payment;
import com.pkb.payment.model.vo.PaymentInfo;

public class PaymentService2 {


   public HashMap<String, Object> selectMainInfo(int currPage, int limit) {
      Connection con = getConnection();
      HashMap<String, Object> totalInfo = null;

      HashMap<String, Integer> todayInfo = new PaymentDao().selectTodayPaymentHistoryList(con);

      if (todayInfo != null) {
         ArrayList<Payment> plist = new PaymentDao().selectTotalList(con, currPage, limit);
         totalInfo = new HashMap<String, Object>();
         totalInfo.put("todayInfo", todayInfo);
         totalInfo.put("plist", plist);

      }

      close(con);

      return totalInfo;
   }

   public int getListCount() {
      Connection con = getConnection();
      int count = new PaymentDao().getListCount(con);
      close(con);
      return count;
   }

   public HashMap<String, Object> selectRecPay(int contract_no, int user_no) {
      Connection con = getConnection();

      HashMap<String, Object> rp = new PaymentDao().selectRecPay(contract_no, user_no, con);
      if (rp != null) {

      }

      return rp;
   }

   public ArrayList<Payment> selectListInquiry(int user_no,String pay_date, String pay_method,int currentPage, int limit) {
      Connection con = getConnection();
      ArrayList<Payment> inquiry = new PaymentDao2().selectListInquiry(user_no, pay_date, pay_method, con, currentPage, limit);

      close(con);

      return inquiry;
   }

   public int getSearchListCount(String date, String method, String division) {
      Connection con = getConnection();
      int count = new PaymentDao().getSearchListCount(con, date, method, division);
      close(con);
      return count;
   }

   /*public HashMap<String, Object> searchMainInfo(int currentPage, int limit, String date, String method,
         String division) */{
      /*Connection con = getConnection();
      HashMap<String, Object> totalInfo = null;
      HashMap<String, Integer> todayInfo = new PaymentDao().selectTodayPaymentHistoryList(con);

      if (todayInfo != null) {
         ArrayList<Payment> plist = new PaymentDao().searchMainInfo(con, currentPage, limit, date, method, division);
         totalInfo = new HashMap<String, Object>();
         totalInfo.put("plist", plist);
         totalInfo.put("todayInfo", todayInfo);
      }

      close(con);

      return totalInfo;*/
   }

   public int insertRecharge(Payment py, int user_no) {
      Connection con = getConnection();

      int result = new PaymentDao().insertRecharge(con, py);

      int result2 = 0;
      int result3 = 0;
      if (result > 0) { // 결제 테이블 insert한 결과가 1일시
         result2 = new PaymentDao().insertPayHistory(con, user_no);

         if (result2 > 0) {
            // 사이버머니 이력 테이블에 insert한 결과가 1일시

            result3 = new PaymentDao().updateCybermoney(con, user_no, py);

            if (result3 > 0) { // 잔액 업데이트한 결과가 1일시

               commit(con);
            } else {
               rollback(con);
            }
            close(con);

         } else {
            rollback(con);
         }

      } else {
         rollback(con);
      }

      return result3; // *??
   }

   public CyberMoney searchCyberMoney(int user_no) {
      Connection con = getConnection();

      CyberMoney cm = new PaymentDao().searchCyberMoney(con, user_no);

      close(con);

      return cm;
   }

   public PaymentInfo searchRecPayInfo(int contract_no, int user_no) {
      Connection con = getConnection();

      PaymentInfo pi = new PaymentDao().searchRecPayInfo(con, contract_no, user_no);

      close(con);

      return pi;
   }

public int selectListInquiryCount(int user_no, String pay_date, String pay_method) {
	 Connection con = getConnection();
     int count = new PaymentDao2().selectListInquiryCount(con,user_no, pay_date, pay_method);
     close(con);
     return count;
}

public HashMap<String, Object> searchMainInfo(int currentPage, int limit, String pay_date, String pay_method) {
	Connection con = getConnection();
    HashMap<String, Object> totalInfo = null;
    HashMap<String, Integer> todayInfo = new PaymentDao().selectTodayPaymentHistoryList(con);

    if (todayInfo != null) {
       ArrayList<Payment> plist = new PaymentDao2().searchMainInfo(con, currentPage, limit, pay_date, pay_method);
       totalInfo = new HashMap<String, Object>();
       totalInfo.put("plist", plist);
       totalInfo.put("todayInfo", todayInfo);
    }

    close(con);

    return totalInfo;
}



}

