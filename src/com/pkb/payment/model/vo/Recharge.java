package com.pkb.payment.model.vo;

public class Recharge {
	    //아임포트 관련
		private String imp_uid;				//아임포트 거래 고유 번호
		private String pg_provider;			//결제승인/시도된 PG사
		private int amount;					//결제할 금액
		private String name;				//주문명
		private String pay_method;			//결제수단
		private boolean permission;
		private boolean validation;
		private String status;				//결제상태 ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)
		private String receipt_url;			//PG사에서 발행되는 거래 매출전표 URL
		private String merchant_uid;		//가맹점에서 생성/관리하는 고유 주문번호
		
		public Recharge(){}

		public Recharge(String imp_uid, String pg_provider, int amount, String name, String pay_method,
				boolean permission, boolean validation, String status, String receipt_url, String merchant_uid) {
			super();
			this.imp_uid = imp_uid;
			this.pg_provider = pg_provider;
			this.amount = amount;
			this.name = name;
			this.pay_method = pay_method;
			this.permission = permission;
			this.validation = validation;
			this.status = status;
			this.receipt_url = receipt_url;
			this.merchant_uid = merchant_uid;
		}

		public String getImp_uid() {
			return imp_uid;
		}

		public String getPg_provider() {
			return pg_provider;
		}

		public int getAmount() {
			return amount;
		}

		public String getName() {
			return name;
		}

		public String getPay_method() {
			return pay_method;
		}

		public boolean isPermission() {
			return permission;
		}

		public boolean isValidation() {
			return validation;
		}

		public String getStatus() {
			return status;
		}

		public String getReceipt_url() {
			return receipt_url;
		}

		public String getMerchant_uid() {
			return merchant_uid;
		}

		public void setImp_uid(String imp_uid) {
			this.imp_uid = imp_uid;
		}

		public void setPg_provider(String pg_provider) {
			this.pg_provider = pg_provider;
		}

		public void setAmount(int amount) {
			this.amount = amount;
		}

		public void setName(String name) {
			this.name = name;
		}

		public void setPay_method(String pay_method) {
			this.pay_method = pay_method;
		}

		public void setPermission(boolean permission) {
			this.permission = permission;
		}

		public void setValidation(boolean validation) {
			this.validation = validation;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public void setReceipt_url(String receipt_url) {
			this.receipt_url = receipt_url;
		}

		public void setMerchant_uid(String merchant_uid) {
			this.merchant_uid = merchant_uid;
		}

		@Override
		public String toString() {
			return "Recharge [imp_uid=" + imp_uid + ", pg_provider=" + pg_provider + ", amount=" + amount + ", name="
					+ name + ", pay_method=" + pay_method + ", permission=" + permission + ", validation=" + validation
					+ ", status=" + status + ", receipt_url=" + receipt_url + ", merchant_uid=" + merchant_uid + "]";
		}
		
		
}
