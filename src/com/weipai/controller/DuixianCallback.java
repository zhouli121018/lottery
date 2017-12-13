package com.weipai.controller;

import com.weipai.Withdraw.WithdrawCallback;
import com.weipai.model.Paylog;
import com.weipai.service.LotResultService;

public class DuixianCallback implements WithdrawCallback {
	private String randomNum;
	private LotResultService lotResultService;
	private boolean result;
	private int tixianStatus;
	@Override
	public void onFail(String err_code, String err_code_des) {
		// TODO Auto-generated method stub
		//2标识提现失败
		lotResultService.updateExchangeLot(randomNum,2);
		result = false;
	}

	@Override
	public void onSuccess(String partner_trade_no, String payment_no, String payment_time) {
		// TODO Auto-generated method stub
		lotResultService.updateExchangeLot(randomNum,1);
		result = true;
	}

	public LotResultService getLotResultService() {
		return lotResultService;
	}

	public void setLotResultService(LotResultService lotResultService) {
		this.lotResultService = lotResultService;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public int getTixianStatus() {
		return tixianStatus;
	}

	public void setTixianStatus(int tixianStatus) {
		this.tixianStatus = tixianStatus;
	}

	public String getRandomNum() {
		return randomNum;
	}

	public void setRandomNum(String randomNum) {
		this.randomNum = randomNum;
	}

	
	
	
}
