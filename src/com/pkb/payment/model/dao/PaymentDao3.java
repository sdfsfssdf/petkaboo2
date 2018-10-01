package com.pkb.payment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;
import static com.pkb.common.JDBCTemplate.close;
public class PaymentDao3 {
	private Properties prop = new Properties();

	public PaymentDao3() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {

			e.printStackTrace();
		}
	}
}
