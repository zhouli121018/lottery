package com.weipai.service;

import java.util.List;
import java.util.Map;

import com.weipai.model.Account;


public interface AccountService {

	 int selectMaxId();
	 Account selectByPrimaryKey(Integer id);
	 int insert(Account record);
	 
	 Account selectByUuid(Integer uuid);
	 Account selectUuidByUnionid(Map<String , Object> map);
	/**
     * 代理商/零售商得到其下面的所有普通用户
     * @param map
     * @return
     */
     List<Account> selectObjectsByMap(Map<String ,Integer> map);
     /**
      * !-- 对得到条件代理商/零售商下面所有的用户个数 -->
      * @param map
      * @return
      */
     Integer selectObjectCountByMap(Map<String, Integer> map);
     /**
      * 获取所有玩家
      * @param map
      * @return
      */
     List<Account> selectAllAccount(Map<String , Object> map);
     
     int updateAccountStatus(Map<String,Object> map);
     int updateAccountStatusByUuid(Map<String,Object> map);

	Account selectByManagerId(Integer managerId);


	int selectSzieByManagerId(Map<String, Object> map);
	Account selectByOpenId(String openId);
	void updateRedcardByOpenId(Map<String, Object> params);
	
}
