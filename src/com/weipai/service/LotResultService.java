package com.weipai.service;

import java.util.List;
import java.util.Map;

import com.weipai.model.Account;
import com.weipai.model.BetlogLot;
import com.weipai.model.ExchangeLot;
import com.weipai.model.ResultLot;

public interface LotResultService {
	//获得彩票开奖结果，更新最新结果
	public List<ResultLot> getRecentLotResult(Map<String ,Object> map);
	public int insertResultLot(ResultLot resultLot);
	//投注和查询最新的投注结果
	public List<BetlogLot> getRecentBetlogLot(Map<String ,Object> map);
	public int insertBetlogLot(BetlogLot betlogLot,BetlogLot curExist);
	
	//兑奖处理
	public List<ExchangeLot> getRecentExchangeLot(Map<String ,Object> map);
	public int insertExchangeLot(ExchangeLot exchangeLot);
	
	public int updateExchangeLot(String serialNum,int status);
	public ExchangeLot selectExchangeByRandomNum(String randomNum);
	
	//开奖处理
	public int openLotProcess(Map<String ,Object> map);
	
	public void getRecentBetlogLotWinner();
	
	public Account getAccountByUuid(int uuid);
	
}
