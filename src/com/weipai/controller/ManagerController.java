package com.weipai.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.weipai.Withdraw.WithdrawCash;
import com.weipai.controller.base.BaseController;
import com.weipai.model.Account;
import com.weipai.model.BetlogLot;
import com.weipai.model.ExchangeLot;
import com.weipai.model.Manager;
import com.weipai.model.ManagerNode;
import com.weipai.model.Paylog;
import com.weipai.model.ResultLot;
import com.weipai.service.AccountService;
import com.weipai.service.LotResultService;
import com.weipai.service.ManagerService;
import com.weipai.service.PaylogService;
import com.weipai.utils.Futil;
import com.weipai.utils.StringUtil;
import java.nio.ByteBuffer;
@Controller
@RequestMapping("/manager")
public class ManagerController extends BaseController {
//	public static final String IP_ADDR = "localhost";//服务器地址 
//	public static final int PORT = 10123;//服务器端口号  
	@Autowired
	private ManagerService managerService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private PaylogService paylogService;
	
	@Autowired
	private LotResultService lotResultService;
	
	public static Map<Integer,List<ManagerNode>> managerCache = new HashMap<Integer,List<ManagerNode>>();
	public static Map<Integer,ManagerNode> managerNodeCache = new HashMap<Integer,ManagerNode>();
	public static Map<Integer,Long> cacheTimestamp = new HashMap<Integer,Long>();
	public static Map<Integer,Map<Integer,String>> pathCache = new HashMap<Integer,Map<Integer,String>>();
	public static volatile int status = 0;
	public static CopyOnWriteArrayList<BetlogLot> curBetWinner = new CopyOnWriteArrayList<>();
	public static CopyOnWriteArrayList<BetlogLot> curBet = new CopyOnWriteArrayList<>();
	public static Map<Integer,Map<Integer,Map<Integer,BetlogLot>>> betlogs = new HashMap<Integer,Map<Integer,Map<Integer,BetlogLot>>>();
	public static Map<Integer,Integer> managerLeftcard = new HashMap<Integer,Integer>();
	private static SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd000"); 
	private static long curSerial = 0L;

	/**
	 * 后台登录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String yqm = request.getParameter("yqm");
		JSONObject json = new JSONObject();
		String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY); 
		boolean kaptchaRight = kaptchaExpected.equals(yqm);
		if (kaptchaRight&&StringUtil.isNotEmpty(username) && StringUtil.isNotEmpty(password)) {//
			Manager manager =null;
			manager = managerService.selectManagerByInvoteCode(Integer.parseInt(username));
			Account account = new Account();
			if(manager!=null&&manager.getPowerId()>1)
			account = accountService.selectByManagerId(manager.getId());
			System.out.println(StringUtil.MD5(password));
			
			if (manager != null
					&& StringUtil.MD5(password).equals(manager.getPassword())) {
				json.put("mess", "7");
				//登录成功 用户信息放入缓存
				session.setAttribute("manager", manager);
				if(account!=null)
				session.setAttribute("userAccount", account);
				if(manager.getManagerUpId()!=null&&manager.getManagerUpId()>0){
					Manager managerUp = managerService.selectByPrimaryKey(manager.getManagerUpId());
					session.setAttribute("managerUp", managerUp);
				}
				if(manager.getPowerId() == 1){
					//如果是超管登录  则需要返回最新公告
//					NoticeTable notice = noticeTableService.selectRecentlyObject(new HashMap<String,Object>()).get(0);
//					ContactWay contactWay = contactWayService.selectByPrimaryKey(1);
//					if(notice != null){
//						session.setAttribute("notice", notice.getContent()+"");
//						session.setAttribute("contactway", contactWay.getContent()+"");
//					}
					json.put("mess", "0");
				}
				
				
				int powerId = manager.getPowerId();
				int type = 0;
				if(manager.getId()!=1){
				

				}else{
//					manager = managerService.selectByPrimaryKey(manager.getId());
//					int mineone = paylogService.sumByManagerId(manager.getId(), type);
//					int minetwo = paylogService.sumSubByManagerId(manager.getId(), type,powerId);
//					String oneString = "￥"+mineone+"("+100*Params.getPercentage1(manager.getPowerId())+"%)";
//					String twoString = "￥"+minetwo+"("+100*Params.getPercentage2(manager.getPowerId())+"%)";
//					DecimalFormat    df   = new DecimalFormat("######0.00");   
//					String total = df.format(mineone*Params.getPercentage1(manager.getPowerId())+minetwo*Params.getPercentage2(manager.getPowerId()));
//					session.setAttribute("mineone", oneString);
//					session.setAttribute("minetwo", twoString);
//					session.setAttribute("total", total);
				}
				
				
			} else {
				json.put("mess", "1");
			}
		} else {
			json.put("mess", "2");
		}
		returnMessage(response, json);
	}
	
	
	@RequestMapping("/delivery")
	public void delivery(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream) request.getInputStream()));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }

        String xmlCnt = sb.toString();

        System.out.println("DeliveryServlet-0" + xmlCnt);

        String returnCode = "SUCCESS";
        String userId = null;
        String productId = null;
        String trade_time = null;
        String money = null;
        int amount = 0;
        int onbind = 0;
                

        try {
            Map map = Futil.doXMLParse(xmlCnt);
            userId = (String) map.get("userId");
            productId = (String) map.get("productId");
            trade_time = (String) map.get("trade_time");
            money = (String) map.get("money");
            amount = Integer.parseInt((String) map.get("amount"));
            onbind = Integer.parseInt((String) map.get("onbind"));

        } catch (Exception e) {
            e.printStackTrace();
        }


        if (userId == null ||
                productId == null ||
                !Futil.checkSign(xmlCnt, "08ceo76q9jkfa16ir56pm334cegh")) {
            returnCode = "FAIL";
        } else {
            int shiftcard = amount;
            Account account = accountService.selectByOpenId(userId);
                Map<String,Object> params = new HashMap<String,Object>();
                params.put("redCard", shiftcard);
                params.put("openId", userId);
                accountService.updateRedcardByOpenId(params);

            //TODO 更新购买记录
            Paylog paylog = new Paylog();
            paylog.setManagerid(account.getManagerUpId());
            paylog.setMoney(Double.parseDouble(money));
            paylog.setPaycount(shiftcard);
            DateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss"); 
            long payTime = -1L;
            try {
            	payTime = format1.parse(trade_time).getTime();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            paylog.setPaytime(new Date(System.currentTimeMillis()));
//            paylog.setPaytime(new Date(payTime));
            paylog.setPaytype(0);
            paylog.setStatus(0);
            paylog.setUuid(account.getUuid());
            int result = 0;
            paylog.setGameId(2);
            result = paylogService.insertPaylog(paylog);
            System.out.println("插入结果============"+result);
        }

        System.out.println("DeliveryServlet " + "uid = " + userId + " pid = " + productId);

        JSONObject js = new JSONObject();
        js.put("returnCode", returnCode);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");

        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.write(js.toString());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
        }
//        request.getRequestDispatcher("/index.jsp").forward(request,response);
        returnMessage(response, js);
	}
	
	
//	@RequestMapping("/tixian")
//	public void tixian(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		JSONObject json = new JSONObject();
//		Manager manager = (Manager) session.getAttribute("manager");
//		synchronized(this){
//		if(manager != null){
//			//获取所有玩家   
//			int mineone = paylogService.sumByManagerId(manager.getId(), 0);
//			int minetwo = 0;
//			int powerId = manager.getPowerId();
////			if(powerId==5||powerId==4)//总代理
//				minetwo = paylogService.sumSubByManagerId(manager.getId(), 0,powerId);
////				else
////					minetwo = paylogService.sumSubByManagerId(manager.getId(), 0,powerId);
//			double total = mineone*Params.getPercentage1(manager.getPowerId())+minetwo*Params.getPercentage2(manager.getPowerId());
//			if(total>99.99){
//			 Paylog paylog = new Paylog();
//	            paylog.setManagerid(manager.getId());
//	            paylog.setMoney(total);
//	            paylog.setPaycount(0);
//	            paylog.setPaytime(new java.util.Date());
//	            paylog.setPaytype(1);//0是用户充值，1是代理提现
//	            paylog.setStatus(0);//0为正常状态，1为已经处理的状态
//	            paylog.setUuid(manager.getId());
//	            int result = paylogService.insertPaylog(paylog);
//	            
//	            if(result>0){
//	            	Account account = accountService.selectByManagerId(manager.getId());
//	            	String ip = getIpAddress(request);
//	            	TixianCallback cb = new TixianCallback();
//	            	cb.setPaylog(paylog);
//	            	cb.setPaylogService(paylogService);
//	            	cb.setManagerId(manager.getId());
////	            	int tixianStatus = 1;
////	            	if(powerId==2)
////	            		tixianStatus = 1;
////	            	else if(powerId==2){
////	            		
////	            	}
//	            	if(manager.getManagerUpId()<1)//如果没有父级代理，则所有的可提现的都被封死
//	            		powerId = 5;
//	            	cb.setTixianStatus(powerId);
//	            	//
////	            	WithdrawCash.doTransfer(account.getOpenid(), manager.getName(), (float)total, "这是一次转账请求", ip, cb);
//	            	cb.onSuccess("", "", "");
////	            	WithdrawCash.doTransfer("oBmF40ktpoBu3w7MQ1PkCcFpQO6Q", "赖西湖", 1f, "这是一次转账请求", "221.223.235.121", cb);
////	            	paylog.setStatus(1);
////	            	paylogService.tixianDone(paylog.getId(),2);
//	            	if(cb.isResult()){
//	            	json.put("total", total);
//	            	DecimalFormat    df   = new DecimalFormat("######0.00"); 
//	            	json.put("info", "你的提现人民币"+df.format(total)+"元的请求已经发出！请留意你的微信转账记录！");
//	            	}else{
//	            		json.put("error", "你提交的个人账务信息错误，请和系统管理员联系！");
//	            	}
//	            	System.out.println("返回的字符串==========="+json.toString());
//	            }else{
//	            	json.put("error", "提现请求失败！");
//	            	System.out.println("返回的字符串==========="+json.toString());
//	            }
//			}else{
//				json.put("error", "你可以提现的余额不足100!");
//			}
//			returnMessage(response, json.toString());
//		}
//		}
//	}
	
	
	@RequestMapping("/getRecentLotResult")
	public void getRecentLotResult(HttpServletRequest request, HttpServletResponse response) {
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		String num = request.getParameter("num");
		String uuid = request.getParameter("uuid");
		
		Map<String,Object> map = new HashMap<>();
		if(num!=null&&!"".equals(num))
			map.put("number", Integer.parseInt(num));
		List<ResultLot> result = lotResultService.getRecentLotResult(map);
		if(uuid!=null&&!"".equals(uuid)){
		Account account = lotResultService.getAccountByUuid(Integer.parseInt(uuid));
		json.put("redCard", account.getRedCard());
		}
		
		for (ResultLot account : result) {
			array.add(account);
		}
		//获取最近二十期的开奖记录
		Calendar calendar = Calendar.getInstance();
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int min = calendar.get(Calendar.MINUTE);
		int second = 0;//和五分钟的差
		if(hour>=10&&hour<22){//10:00-22:00,每十分钟一期
			second = (int)(600-(System.currentTimeMillis()%(1000*60*10))/1000);
		}else if(hour>=22||hour<2){//22:00-2:00
			second = (int)(300-(System.currentTimeMillis()%(1000*60*5))/1000);
		}else{//2：00-10：00不开奖,可以买早上10点的哪一期
			second = ((10-hour)*60-min)*60;//离开奖还剩多少秒
		}
		
			
		json.put("nowTime", second);
		json.put("curNum", getCurSerialNum());
		json.put("lotResult", array);
		json.put("status", status);
		returnMessage(response, json.toString());
	}
	
	@RequestMapping("/selectInviteCodeByUuid")
	public void selectInviteCodeByUuid(HttpServletRequest request, HttpServletResponse response) {
		JSONObject json = new JSONObject();
		String uuid = request.getParameter("uuid");
		if(uuid!=null&&!"".equals(uuid)){
			Account account = accountService.selectByUuid(Integer.parseInt(uuid));
			if(account.getManagerId()>0){
				Manager manager = managerService.selectByPrimaryKey(account.getManagerId());
				json.put("status", 1);
				json.put("inviteCode", manager.getInviteCode());
				json.put("managerId", manager.getId());
			}else{
				json.put("status", 0);
				json.put("msg", "您还不是代理，代理请联系管理员！");
			}
		}
		returnMessage(response, json.toString());
	}
	
	@RequestMapping("/getRecentExchangeLot")
	public void getRecentExchangeLot(HttpServletRequest request, HttpServletResponse response) {
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		String uuid = request.getParameter("uuid");
		String startN = request.getParameter("startNum");
		String pageNum = request.getParameter("pageNum");
		Map<String,Object> map = new HashMap<>();
		
		if(uuid!=null&&!"".equals(uuid))
			map.put("uuid", Integer.parseInt(uuid));
			else{
				return;
			}
		
		int startNum = 0,pageNumber = 10;
		if(startN!=null&&!"".equals(startN))
			startNum = Integer.parseInt(startN);
		if(pageNum!=null&&!"".equals(pageNum))
			pageNumber = Integer.parseInt(pageNum);
		
			map.put("startNum",startNum );
			map.put("pageNumber", pageNumber);
		List<ExchangeLot> result = lotResultService.getRecentExchangeLot(map);
		
		for (ExchangeLot account : result) {
			array.add(account);
		}
		//获取最近二十期的开奖记录
		json.put("exchangeLot", array);
		returnMessage(response, json.toString());
	}
	
	
	@RequestMapping("/getRecentBet")
	public void getRecentBet(HttpServletRequest request, HttpServletResponse response) {
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		Map<String,Object> map = new HashMap<>();
		
		String uuid = request.getParameter("uuid");
		String serialNum = request.getParameter("serialNum");
		String startN = request.getParameter("startNum");
		String pageNum = request.getParameter("pageNum");
		String betResult = request.getParameter("betResult");
		if(uuid!=null&&!"".equals(uuid))
		map.put("uuid", Integer.parseInt(uuid));
		else{
			return;
		}
		if(serialNum!=null&&!"".equals(serialNum))
			map.put("serialNum", Integer.parseInt(serialNum));
		int startNum = 0,pageNumber = 10;
		if(betResult!=null&&!"".equals(betResult)){
			int br = Integer.parseInt(betResult);
			map.put("betResult",br );
		}
		if(startN!=null&&!"".equals(startN))
			startNum = Integer.parseInt(startN);
		if(pageNum!=null&&!"".equals(pageNum))
			pageNumber = Integer.parseInt(pageNum);
		
			map.put("startNum",startNum );
			map.put("pageNumber", pageNumber);
		List<BetlogLot> result = lotResultService.getRecentBetlogLot(map);
		for (BetlogLot account : result) {
			array.add(account);
		}
		if(uuid!=null&&!"".equals(uuid)){
			Account account = lotResultService.getAccountByUuid(Integer.parseInt(uuid));
			json.put("redCard", account.getRedCard());
		}
		//获取最近二十期的开奖记录
		json.put("betResult", array);
		returnMessage(response, json.toString());
	}
	
	
	public static long getCurSerialNum(){
		java.util.Date now = new java.util.Date();
		
		String a = format.format(now);
		Calendar calendar = Calendar.getInstance();
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int min = calendar.get(Calendar.MINUTE);
		long serialNum =  Long.parseLong(a);
		int hourShift = 0,minShift=0;
		if(hour<2){//5分钟一期
			hourShift = hour*12;
			minShift = (int)(min/5)+1;
		}else if(hour>9&&hour<22){//10分钟一期
			hourShift = (hour-10)*6+24;
			minShift = (int)(min/10)+1;
		}else if(hour>=22){//5分钟一期
			hourShift = (hour-22)*12+96;
			minShift = (int)(min/5)+1;
		}else{
			hourShift = 0;
			minShift = 25;
		}
		if(curSerial==0)
			curSerial = serialNum+hourShift+minShift;
		return serialNum+hourShift+minShift;
	}
	//
	@RequestMapping("/betlogLot")
	public void betlogLot(HttpServletRequest request, HttpServletResponse response) {
		JSONObject json = new JSONObject();
		String bettype = request.getParameter("type");
		String betmount = request.getParameter("amount");
//		String serialnum = request.getParameter("serialNum");
		String uuid = request.getParameter("uuid");
		String facevalue = request.getParameter("facevalue");
		String cardcount = request.getParameter("cardcount");
		String nickName = request.getParameter("nickName");
		String id = request.getParameter("id");
		
		try {
			nickName = new String(nickName .getBytes("utf-8"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long serialNum =  getCurSerialNum();
		if(serialNum!=curSerial){
			curSerial = serialNum;//期数发生变更，其他的缓存都要刷新
			betlogs.clear();
		}
		try{
		String[] singleBetTypes = bettype.split(",");
		String[] facevalues = facevalue.split(",");
		String[] cardcounts = cardcount.split(",");
		int length = singleBetTypes.length;
		Account account = accountService.selectByUuid(Integer.parseInt(uuid));//当前投注人绑定的代理信息
		int managerId = account.getManagerUpId();
		int left =  0;
		if(managerLeftcard.containsKey(managerId)){
			left = managerLeftcard.get(managerId);
		}else{
			Account managerAccount = accountService.selectByManagerId(managerId);
			managerLeftcard.put(managerId, managerAccount.getRedCard());
			left = managerAccount.getRedCard();
		}
		
		
		if(checkCanBet(managerId,left)){
		for(int i=0;i<length;i++){//循环插入，避免出现重复
			String singleBetType = singleBetTypes[i];
		BetlogLot lottery = new BetlogLot();
		lottery.setBettype(Integer.parseInt(singleBetType));
		lottery.setBetmount(Integer.parseInt(betmount)/length);
		lottery.setLotid(0);
		lottery.setBetresult(-1);
		
		lottery.setSerialnum(serialNum);
		lottery.setUuid(Integer.parseInt(uuid));
		lottery.setCreatetime(new java.util.Date());
		lottery.setFacevalue((facevalues[i]));
		lottery.setCardcount((cardcounts[i]));
		int betType = Integer.parseInt(singleBetType);
		BetlogLot curExist = null;
		
		//获取最近二十期的开奖记录
		int result = 0;
		int uuid2 = Integer.parseInt(uuid);
		if(betlogs.containsKey(managerId)){
			
			Map<Integer,Map<Integer,BetlogLot>> midBetlogs = betlogs.get(managerId);
			
			if(midBetlogs.containsKey(betType)){
				Map<Integer,BetlogLot> uuidBetlogs = midBetlogs.get(betType);
				if(uuidBetlogs.containsKey(uuid2)){
					curExist = uuidBetlogs.get(uuid2);
					result = lotResultService.insertBetlogLot(lottery,curExist);
					//更新缓存中的投注类
//					curExist.setBetmount(curExist.getBetmount()+lottery.getBetmount());
//					curExist.setFacevalue(curExist.getFacevalue()+","+lottery.getFacevalue());
//					curExist.setCardcount(curExist.getCardcount()+","+lottery.getCardcount());
				}else{
					result = lotResultService.insertBetlogLot(lottery,curExist);
					uuidBetlogs.put(uuid2, lottery);
				}
			}else{
				Map<Integer,BetlogLot> uuidBetlogs = new HashMap<Integer,BetlogLot>();
				result = lotResultService.insertBetlogLot(lottery,curExist);
				uuidBetlogs.put(uuid2, lottery);
				midBetlogs.put(betType, uuidBetlogs);
			}
		}else{
			Map<Integer,Map<Integer,BetlogLot>> midBetlogs = new HashMap<Integer,Map<Integer,BetlogLot>>();
			Map<Integer,BetlogLot> uuidBetlogs = new HashMap<Integer,BetlogLot>();
			result = lotResultService.insertBetlogLot(lottery,curExist);
			uuidBetlogs.put(uuid2, lottery);
			midBetlogs.put(betType, uuidBetlogs);
			betlogs.put(managerId, midBetlogs);
		}
//		lottery.setLotResult(nickName);
		curBet.add(lottery);
		if(result>0){
		json.put("result", true);
//		sendRedcardChange(Integer.parseInt(uuid),Integer.parseInt(betmount),4);
		}else
			json.put("result", false);
		
		}
		}
		}catch(Exception ee){
			ee.printStackTrace();
			json.put("result", false);
		}
		json.put("id", id);
		returnMessage(response, json.toString());
	}
	
	
	
	@RequestMapping("/exchangeLot")
	public void exchangeLot(HttpServletRequest request, HttpServletResponse response) {
		ExchangeLot exchangeLot = new ExchangeLot();
		JSONObject json = new JSONObject();
		String betmount = request.getParameter("amount");
		String uuid = request.getParameter("uuid");
		String facevalue = request.getParameter("facevalue");
		String cardcount = request.getParameter("cardcount");
		String id = request.getParameter("id");
		String randomString = getRandomString(32);
		try{
			
			exchangeLot.setRandomnum(randomString);
			exchangeLot.setAmount(Double.parseDouble(betmount));
			exchangeLot.setCreatetime(new java.util.Date());
			exchangeLot.setStatus(0);//开始兑现，兑现完成后确认
			exchangeLot.setUuid(Integer.parseInt(uuid));
			exchangeLot.setFacevalue(Integer.parseInt(facevalue));
			exchangeLot.setCardcount(Integer.parseInt(cardcount));
		
		int result = lotResultService.insertExchangeLot(exchangeLot);
		if(result>0){

		int trueuuid = Integer.parseInt(uuid);
		//通知牛牛客户端用户红钻数量变更
//		sendRedcardChange(trueuuid,Integer.parseInt(betmount),5);
		Account account = accountService.selectByUuid(trueuuid);
		if(account!=null){
    	String ip = getIpAddress(request);
    	DuixianCallback cb = new DuixianCallback();
    	cb.setRandomNum(randomString);
    	cb.setLotResultService(lotResultService);

    	WithdrawCash.doTransfer(account.getOpenid(), null, Float.parseFloat(""+exchangeLot.getAmount()*0.99)/10, "这是一次转账请求", ip, cb);
		
		
		json.put("result", randomString);
		}else
			json.put("result", "");
		}
		}catch(Exception ee){
			ee.printStackTrace();
			json.put("result", "");
		}
		json.put("id", id);
		returnMessage(response, json.toString());
	}
	/**
	 * 获得最新一期的中奖信息放入内存
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getBetWinnerNews")
	public void getBetWinnerNews(HttpServletRequest request, HttpServletResponse response){
		if(status==1){
			try {
				Thread.sleep(2000);
				} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		for (BetlogLot account : curBetWinner) {
			if(account.getNickName()==null){
			account.setNickName(account.getLotResult());
			account.setLotResult("");
			}
			array.add(account);
			
		}
		//获取最近二十期的开奖记录
		json.put("betWinner", array);
		returnMessage(response, json.toString());
	}
	/**
	 * 获得最新一期的投注信息放入内存
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getBetNews")
	public void getBetNews(HttpServletRequest request, HttpServletResponse response){
		if(status==1){
			try {
				Thread.sleep(2000);
				} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		for (BetlogLot account : curBet) {
			if(account.getNickName()==null){
			account.setNickName(account.getLotResult());
			account.setLotResult("");
			}
			array.add(account);
		}
		//获取最近二十期的开奖记录
		json.put("betWinner", array);
		returnMessage(response, json.toString());
	}
	
	@RequestMapping("/checkCanBet")
	public void checkCanBet(HttpServletRequest request, HttpServletResponse response){
		JSONObject json = new JSONObject();
		String uuid = request.getParameter("uuid");
		Account account = accountService.selectByUuid(Integer.parseInt(uuid));
		if(account.getManagerUpId()!=null){
			int managerUpId = account.getManagerUpId();
			if(managerUpId>0){
				json.put("res", 1);
			}else{
				json.put("res", 0);
			}
		}else{
			json.put("res", 0);
		}
		returnMessage(response, json);
	}
	
	@RequestMapping("/addInviteCode")
	public void addInviteCode(HttpServletRequest request, HttpServletResponse response){
		JSONObject json = new JSONObject();
		String uuid = request.getParameter("uuid");
		String inviteCode = request.getParameter("inviteCode");
		if(StringUtil.isInteger(inviteCode, 0, 0)){
			Manager manager = managerService.selectManagerByInvoteCode(Integer.parseInt(inviteCode));
			if(manager!=null){
				int managerId = manager.getId();
				Map<String,Object> map = new HashMap<>();
				map.put("uuid", Integer.parseInt(uuid));
				map.put("managerUpId", managerId);
				int res = accountService.updateAccountStatusByUuid(map);
				if(res>0){
					json.put("status", 1);
				}else{
					json.put("status", 0);
				}
			}else{
				json.put("status", 0);
			}
		}else{
			json.put("status", 0);
		}
		returnMessage(response, json);
	}
	
	@RequestMapping("/getUuidByUnionid")
	public void getUuidByUnionid(HttpServletRequest request, HttpServletResponse response){
		String unionid = request.getParameter("unionid");
		String nickname = request.getParameter("nickname");
		String openid = request.getParameter("openid");
		String headIcon = request.getParameter("headimgurl");
		String city = request.getParameter("city");
		String province = request.getParameter("province");
		String sex = request.getParameter("sex");
		String managerUpId = request.getParameter("managerId");
		JSONObject json = new JSONObject();
		Account account = accountService.selectByOpenId(openid);
		if(account!=null){
			json.put("uuid", account.getUuid());
			json.put("managerId", account.getManagerId());
		}else{
			Account newaccount = new Account();
			newaccount.setOpenid(openid);
			newaccount.setUuid(accountService.selectMaxId()+135797);
			newaccount.setRoomcard(0);
			newaccount.setHeadicon(headIcon);
			try {
				nickname = new String(nickname.getBytes("ISO-8859-1"),"UTF-8");
				nickname = filterOffUtf8Mb4_2(nickname);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			newaccount.setNickname(nickname);
			newaccount.setCity(city);
			newaccount.setProvince(province);
			newaccount.setSex(Integer.parseInt(sex));
			newaccount.setUnionid(unionid);
			newaccount.setPrizecount(0);
			newaccount.setCreatetime(new java.util.Date());
			newaccount.setActualcard(0);
			newaccount.setTotalcard(0);
			newaccount.setStatus("0");
			newaccount.setIsGame("0");
			if(StringUtil.isInteger(managerUpId, 0, 0)&&Integer.parseInt(managerUpId)>0){
				newaccount.setManagerUpId(Integer.parseInt(managerUpId));
			}
			int result = 0;
			try{
			result = accountService.insert(newaccount);
			}catch(Exception ee){
				System.out.println("插入发生异常");
				ee.printStackTrace();
			}
			if(result>0){
				System.out.println("插入成功");
			json.put("uuid", newaccount.getUuid());
			}
			else{
				System.out.println("插入失败");
				json.put("uuid", 0);
			}
		}
		returnMessage(response, json.toString());
	}
	
	
	
	/**
	 * 退出登录
	 * @param request
	 * @param response
	 */
	@RequestMapping("/logout ")
	public void logout(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession();
		JSONObject json = new JSONObject();
		if(session != null){
			session.invalidate();
		}
		
	}
	
	public static String getRandomString(int length) { //length表示生成字符串的长度  
	    String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";     
	    Random random = new Random();     
	    StringBuffer sb = new StringBuffer();     
	    for (int i = 0; i < length; i++) {     
	        int number = random.nextInt(base.length());     
	        sb.append(base.charAt(number));     
	    }     
	    return sb.toString();     
	 }  
	
	public final static String getIpAddress(HttpServletRequest request){  
        // 获取请求主机IP地址,如果通过代理进来，则透过防火墙获取真实IP地址  
  
        String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("Proxy-Client-IP");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("WL-Proxy-Client-IP");  

            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("HTTP_CLIENT_IP");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getRemoteAddr();  
            }  
        } else if (ip.length() > 15) {  
            String[] ips = ip.split(",");  
            for (int index = 0; index < ips.length; index++) {  
                String strIp = (String) ips[index];  
                if (!("unknown".equalsIgnoreCase(strIp))) {  
                    ip = strIp;  
                    break;  
                }  
            }  
        }  
        return ip;  
    }
	
//	public void sendRedcardChange(int uuid,int shiftCard,int shiftType){
//		JSONObject json = new  JSONObject();
//		json.put("uuid", uuid);
//		json.put("shiftRedcard", shiftCard);
//		json.put("shiftType", shiftType);
//		//发送消息给游戏后台
//		Socket socket = null;
//    	try {
//    		//创建一个流套接字并将其连接到指定主机上的指定端口号
//    		socket = new Socket(IP_ADDR, PORT);  
//            //读取服务器端数据  
//            DataInputStream input = new DataInputStream(socket.getInputStream());  
//            //向服务器端发送数据  
//            DataOutputStream out = new DataOutputStream(socket.getOutputStream());
//			//不同操作不同的ConnectAPI.CREATEROOM_REQUEST值    消息处理方式
//			ClientSendRequest loginSend = new ClientSendRequest(0x158888);
//			loginSend.output.writeUTF(json.toJSONString());
//			out.write(loginSend.entireMsg().array());
////			String content = serverCallBack(input);//游戏服务器返回的信息
//			
//				  out.close();
//		            input.close();
//    	} catch (Exception e) {
//    		e.printStackTrace();
//    		System.out.println("客户端异常:" + e.getMessage()); 
//    	} finally {
//    		if (socket != null) {
//    			try {
//					socket.close();
//				} catch (IOException e) {
//					socket = null; 
//					System.out.println("客户端 finally 异常:" + e.getMessage()); 
//				}
//    		}
//    	}
//	}
	
	public static String serverCallBack(DataInputStream input){
		StringBuffer sb = new StringBuffer();
		try {
			ByteArrayOutputStream outSteam = new ByteArrayOutputStream();  
			byte[] buffer = new byte[input.readInt()];
		    int len = -1;
			if((len = input.read(buffer)) != -1) { 
			        outSteam.write(buffer, 11, len-11);  
			        sb.append(outSteam.toString());
			  } 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb.toString();
			
	}
	
	
	public static boolean checkCanBet(int managerId,int existCardMount){
		boolean result = false;
		Map<Integer,Integer> typeRes = new HashMap<Integer,Integer>();
		Map<Integer,Map<Integer,BetlogLot>> midBetlogs = betlogs.get(managerId);
		int[] typeList = {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89};

		if(midBetlogs!=null)
		for(Entry<Integer,Map<Integer,BetlogLot>> entry1:midBetlogs.entrySet()){
			int key = entry1.getKey();
			Map<Integer,BetlogLot> values = entry1.getValue();
			int betAmount = 0;
			for(BetlogLot bet:values.values()){
				betAmount+=bet.getBetmount();
			}
			typeRes.put(key, betAmount);
		}
		int max = 0,total = 0,totalmax=0;
		for(int i=0;i<typeList.length;i++){
			int key = typeList[i];
			int value = typeRes.containsKey(key)?typeRes.get(key):0;
			if(i%2==0){//
				max=value;
			}else{
				if(max<value)
					max = value;
				totalmax+=max;
			}
			total+=value;
			
		}
		int totalfee = (20*totalmax-11*total)/11;
		result = (existCardMount>=(totalfee+total*0.03));
		managerLeftcard.put(managerId, (int)(existCardMount-(totalfee+total*0.03)));
		return result;
	}
	
	public static String filterOffUtf8Mb4_2(String text) throws UnsupportedEncodingException {
		byte[] bytes = text.getBytes("utf-8");
		ByteBuffer buffer = ByteBuffer.allocate(bytes.length);
		int i = 0;
		while (i < bytes.length) {
		short b = bytes[i];
		if (b > 0) {
		buffer.put(bytes[i++]);
		continue;
		}

		b += 256; //去掉符号位

		if (((b >> 5) ^ 0x06) == 0) {
		buffer.put(bytes, i, 2);
		i += 2;
		System.out.println("2");
		} else if (((b >> 4) ^ 0x0E) == 0) {
		System.out.println("3");
		buffer.put(bytes, i, 3);
		i += 3;
		} else if (((b >> 3) ^ 0x1E) == 0) {
		i += 4;
		System.out.println("4");
		} else if (((b >> 2) ^ 0xBE) == 0) {
		i += 5;
		System.out.println("5");
		} else {
		i += 6;
		System.out.println("6");
		}
		}
		buffer.flip();
		return new String(buffer.array(), "utf-8");
		}


	public static long getCurSerial() {
		return curSerial;
	}


	public static void setCurSerial(long curSerial) {
		ManagerController.curSerial = curSerial;
	}
	
}
