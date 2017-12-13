package com.weipai.service.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.weipai.controller.ManagerController;
import com.weipai.mapper.AccountMapper;
import com.weipai.mapper.BetlogLotMapper;
import com.weipai.mapper.ExchangeLotMapper;
import com.weipai.mapper.ResultLotMapper;
import com.weipai.model.Account;
import com.weipai.model.BetlogLot;
import com.weipai.model.ExchangeLot;
import com.weipai.model.ResultLot;
import com.weipai.service.LotResultService;
@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=RuntimeException.class)
public class LotResultServiceImpl implements LotResultService {

	@Resource
	ResultLotMapper resultLotMapper;
	
	@Resource
	BetlogLotMapper betlogLotMapper;
	
	@Resource
	ExchangeLotMapper exchangeLotMapper;
	
	@Resource
	AccountMapper accountMapper;
	
	@Override
	public List<ResultLot> getRecentLotResult(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return resultLotMapper.getRecentLotResult(map);
	}

	@Override
	public int insertResultLot(ResultLot resultLot) {
		// TODO Auto-generated method stub
		return resultLotMapper.insertSelective(resultLot);
	}

	@Override
	public List<BetlogLot> getRecentBetlogLot(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return betlogLotMapper.getRecentBetlogLot(map);
	}
	
	
	@Override
	public int insertBetlogLot(BetlogLot betlogLot,BetlogLot curExist) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		map.put("uuid", betlogLot.getUuid());
		map.put("serialNum", betlogLot.getSerialnum());
		map.put("betType", betlogLot.getBettype());

		//先查询库里面有没有本期同样的投注记录
//		List<BetlogLot> exist = betlogLotMapper.selectExistCurUuidBets(map);
		map.put("amount", betlogLot.getBetmount());
		try{
		if(curExist==null){
		int result = betlogLotMapper.minu4insertSelective(map);
		if(result>0){
			result = betlogLotMapper.insertSelective(betlogLot);
			if(result>0)
				return result;
			else{
				map.put("amount", 0-betlogLot.getBetmount());
				betlogLotMapper.minu4insertSelective(map);
				 return 0;
			}
		}
		else
			return 0;
		}
		else{
			curExist.setBetmount(curExist.getBetmount()+betlogLot.getBetmount());
			curExist.setFacevalue(curExist.getFacevalue()+","+betlogLot.getFacevalue());
			curExist.setCardcount(curExist.getCardcount()+","+betlogLot.getCardcount());
			int result =  betlogLotMapper.minu4insertSelective(map);
			if(result>0){
				result = betlogLotMapper.updateByPrimaryKey(curExist);
				if(result>0){
					return result;
				}else{
					map.put("amount", 0-betlogLot.getBetmount());
					betlogLotMapper.minu4insertSelective(map);
					return 0;
				}
					
			}else
					return 0;
		}
		}catch(Exception ee){
			ee.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<ExchangeLot> getRecentExchangeLot(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return exchangeLotMapper.getRecentExchangeLot(map);
	}
	
	

	@Override
	public void getRecentBetlogLotWinner() {
		// TODO Auto-generated method stub
		ManagerController.curBetWinner.clear();
		try{
			int startNum = 0;
			int size = 100;
            Map<String,Object> params = new HashMap<>();
            params.put("startNum", startNum);
            params.put("pageNumber", size);
            params.put("serialNum", getCurrentSerialNum());
            List<BetlogLot> res = betlogLotMapper.getRecentBetlogLotWinner(params);
            while(res!=null&&res.size()>0){
            	ManagerController.curBetWinner.addAll(res);
            	startNum+=size;
            	params.put("startNum", startNum);
            	res = betlogLotMapper.getRecentBetlogLotWinner(params);
            }
        	}catch(Exception ee){
        		ee.printStackTrace();
        	}
	}
	
	public static long getCurrentSerialNum(){
		int startSerialNum = 1863426;
		long startTime = 1504322700000L;
		long now = System.currentTimeMillis();
		long result = startSerialNum+(now-startTime)/300000;
		return result;
	}

	@Override
	public int insertExchangeLot(ExchangeLot exchangeLot) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		map.put("uuid", exchangeLot.getUuid());
		map.put("amount", exchangeLot.getAmount());
		int result = betlogLotMapper.minu4insertSelective(map);
		if(result>0)
		return exchangeLotMapper.insertSelective(exchangeLot);
		else
			return 0;
	}
	@Override
	public ExchangeLot selectExchangeByRandomNum(String randomNum){
		return exchangeLotMapper.selectExchangeByRandomNum(randomNum);
	}
	
	@Override
	public int updateExchangeLot(String serialNum,int status) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		map.put("randomNum", serialNum);
		map.put("status", status);
		map.put("finishTime", new java.util.Date());
		return exchangeLotMapper.updateSelective(map);
	}

	@Override
	public int openLotProcess(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return betlogLotMapper.openLot(map);
	}

	@Override
	public Account getAccountByUuid(int uuid) {
		// TODO Auto-generated method stub
		return accountMapper.selectByUuid(uuid);
	}

}
