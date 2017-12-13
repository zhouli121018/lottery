package com.weipai.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.weipai.mapper.AccountMapper;
import com.weipai.model.Account;
import com.weipai.service.AccountService;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=RuntimeException.class)
public class AccountServiceImpl implements AccountService {

	@Resource
	AccountMapper accountMapper;
	
	public List<Account> selectObjectsByMap(Map<String, Integer> map) {
		
		return accountMapper.selectObjectsByMap(map);
	}
	
	public Integer selectObjectCountByMap(Map<String, Integer> map){
		
		return accountMapper.selectObjectCountByMap(map);
	}

	public List<Account> selectAllAccount(Map<String , Object> map){
		
		return accountMapper.selectAllAccount(map);
	}
	
	

	@Override
	public int selectSzieByManagerId(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return accountMapper.selectSzieByManagerId(map);
	}

	@Override
	public Account selectByPrimaryKey(Integer id) {
		return   accountMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public Account selectByOpenId(String openId) {
		return   accountMapper.selectByOpenId(openId);
	}

	@Override
	public Account selectByUuid(Integer uuid) {
		return accountMapper.selectByUuid(uuid);
	}


	@Override
	public int updateAccountStatus(Map<String, Object> map) {
		return accountMapper.updateAccountStatus(map);
	}

	@Override
	public Account selectByManagerId(Integer managerId) {
		// TODO Auto-generated method stub
		return accountMapper.selectByManagerId(managerId);
	}

	@Override
	public Account selectUuidByUnionid(Map<String , Object> map) {
		// TODO Auto-generated method stub
		return accountMapper.selectUuidByUnionid(map);
	}

	@Override
	public int insert(Account record) {
		// TODO Auto-generated method stub
		return accountMapper.insertSelective(record);
	}

	@Override
	public int selectMaxId() {
		// TODO Auto-generated method stub
		return accountMapper.selectMaxId();
	}

	@Override
	public void updateRedcardByOpenId(Map<String, Object> params) {
		// TODO Auto-generated method stub
		accountMapper.updateRedcardByOpenId(params);
	}

	@Override
	public int updateAccountStatusByUuid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return accountMapper.updateAccountStatusByUuid(map);
	}
	
	
}
