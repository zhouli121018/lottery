package com.weipai.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
//import java.util.Iterator;
//import java.util.List;
import java.util.Map;
//import java.io.IOException;
//import java.net.MalformedURLException;
//import java.text.SimpleDateFormat;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.api.gateway.demo.util.HttpUtils;
//import com.gargoylesoftware.htmlunit.BrowserVersion;
//import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
//import com.gargoylesoftware.htmlunit.WebClient;
//import com.gargoylesoftware.htmlunit.html.DomElement;
//import com.gargoylesoftware.htmlunit.html.HtmlPage;
//import com.gargoylesoftware.htmlunit.html.HtmlTableRow;
import com.weipai.controller.ManagerController;
import com.weipai.model.ResultLot;
import java.text.SimpleDateFormat;
@Component
public class Kuai3Crawler {
	
	@Autowired
	private LotResultService lotResultService;
	private static String host = "http://jisucpkj.market.alicloudapi.com";
	private static String path = "/caipiao/query";
	private static String method = "GET";
	private static String appcode = "e3248566fb5c44f4a03507bffeebca1d";
	private static Map<String, String> headers = new HashMap<String, String>();
    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
    
    private static  Map<String, String> querys = new ConcurrentHashMap<String, String>();
    private static String resString = null,issueno = null;
    private static int currentSerialNo = 0;
//    private static long currentDayNum = 0;
	private static SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd000"); 
	List<String> unCatchNos = new ArrayList<String>();
//	public static WebClient webClient = new WebClient(BrowserVersion.CHROME);
	static{
//		webClient.getOptions().setCssEnabled(false);
//		webClient.getOptions().setJavaScriptEnabled(false);
//		webClient.getOptions().setTimeout(10000);
		headers.put("Authorization", "APPCODE " + appcode);
		querys.put("caipiaoid", "73");
	}
	
	@Scheduled(cron="0 1/10 10-21 * * *")  
    public void CrawlerTask(){  
		System.out.println("开始采集10分钟一次");
		if(System.currentTimeMillis()%300000>300000)
			return;
        // 获取两次
        try {
        	craw();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				Thread.sleep(5000);
				CrawlerTask();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} finally{
			ManagerController.status = 0;
		}

    }  
	
	@Scheduled(cron="30 0/5 0,1,22,23 * * *")  
    public void CrawlerTask2(){  
		System.out.println("开始采集5分钟一次");
		if(System.currentTimeMillis()%300000>180000)
			return;
        // 获取两次
        try {
        	craw();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				Thread.sleep(5000);
				CrawlerTask();
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} finally{
			ManagerController.status = 0;
		}

    } 
	
//	public void craw() throws Exception{
//		ManagerController.status = 1;
//		HtmlPage page1 = (HtmlPage)webClient.getPage("http://danishlotto.com/");
//		List<?> tables = page1.getByXPath("//*[@id=\"tab_conbox\"]/li[4]/table/tbody/tr/td[2]/table/tbody/tr[2]");
//		HtmlTableRow row = (HtmlTableRow)tables.get(0);
//		Iterator<DomElement> iter = row.getChildElements().iterator();
//		int flag = 0,serialNum = 0;
//		String resString="";
//		while(iter.hasNext()){
//			DomElement str = (DomElement) iter.next();
//			if(flag==0)
//				serialNum = Integer.parseInt(str.getFirstChild().getNodeValue().trim());
//			else{
//	        String tmp = str.asXml();
//	        tmp = tmp.replace("<td>", "");
//	        tmp = tmp.replace("</td>", "");
//	        tmp = tmp.replace("<br/>", "");
//	        tmp = tmp.replace("\r\n", "");
//	        tmp = tmp.replace(" ", "");
//	        tmp = tmp.trim();
//	        resString = tmp;
//			}
//	        flag++;
//	   }
//		//处理开奖结果
//		int point1=0,point2=0,point3=0;
//		String[] res = resString.split(",");
//		for(int i=0;i<res.length;i++){
//			if(i<6)
//				point1+=Integer.parseInt(res[i]);
//			else if(i<12)
//				point2+=Integer.parseInt(res[i]);
//			else if(i<18)
//				point3+=Integer.parseInt(res[i]);
//		}
//		ResultLot lot = new ResultLot();
//		lot.setLotid(0);
//		long now = new Date().getTime();
//		now = now-now%(1000*60*5);
//		lot.setOpentime(new Date(now));
//		lot.setSerialnum(serialNum);
//		String lotString = ""+point1%10+","+point2%10+","+point3%10;
//		lot.setResult(lotString);
//		lotResultService.insertResultLot(lot);
//		//增加开奖处理
//		int result = point1%10+point2%10+point3%10;//大小单双分别是1，2，3，4
//		int type1 = 0,type2 = 0,type3=0,type4=0,type5=0,type6=0;
//		if(result%2==0)
//			type2 = 4;
//		else
//			type2 = 3;
//		if(result>13)
//			type1=1;
//		else
//			type1=2;
//		if(type1==1){
//			if(type2==3)
//				type3=51;
//			else
//				type3=52;
//		}else{
//			if(type2==3)
//				type3=53;
//			else
//				type3=54;
//		}
//		type4=10+point1%10;
//		type5=20+point2%10;
//		type6=30+point3%10;
//		Map<String,Object> map = new HashMap<>();
//		map.put("serialNum", serialNum);
//		map.put("lotId", 0);
//		map.put("type1", type1);
//		map.put("type2", type2);
//		map.put("type3", type3);
//		map.put("type4", type4);
//		map.put("type5", type5);
//		map.put("type6", type6);
//		map.put("lotResult", lotString);
//		lotResultService.openLotProcess(map);
//		lotResultService.getRecentBetlogLotWinner();//开奖后更新开奖结果
//		ManagerController.curBet.clear();
//		ManagerController.betlogs.clear();
//	}
	
	public void getLotteryRes(){
		try {
			querys.remove("issueno");
	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
//	    	System.out.println(response.toString());
	    	//获取response的body
	    	String res = EntityUtils.toString(response.getEntity());
	    	JSONObject resJson = JSONObject.parseObject(res);
	    	if("ok".equals(resJson.getString("msg"))){
	    		JSONObject result = resJson.getJSONObject("result");
	    		issueno = result.getString("issueno");
	    		resString = result.getString("number");
//	    		String opendate = result.getString("opendate");//"2017-11-03 16:31"
//	    		System.out.println(issueno);
//	    		System.out.println(resString);
//	    		System.out.println(opendate);
	    		if(currentSerialNo==0){//开始执行
	    			currentSerialNo = Integer.parseInt(issueno.substring(9));
	    		}else{//后续执行
	    			int catchCur = Integer.parseInt(issueno.substring(9));
	    			if(catchCur==(currentSerialNo+1)||catchCur==(currentSerialNo+1-120)){//属于正常
	    				currentSerialNo = catchCur;
	    			}else if(currentSerialNo == catchCur){//采集的不是最新一期的数据
	    				Thread.sleep(30000);//等30秒继续采集
	    	    		getLotteryRes();
	    			}else{
	    				System.out.println(currentSerialNo+"此期开始未采集到");
	    				while((currentSerialNo+1)!=catchCur){
	    					currentSerialNo++;
	    					String serialN = null;
	    					if(currentSerialNo==121)
	    						currentSerialNo = 1;
	    					if(currentSerialNo<10)
	    						serialN = "00"+currentSerialNo;
	    					else if(currentSerialNo<100)
	    						serialN = "0"+currentSerialNo;
	    					else
	    						serialN = ""+currentSerialNo;
	    					if(currentSerialNo<catchCur)
	    					unCatchNos.add(""+(getCurrentDayNum()+"-"+serialN));
	    					else
	    						unCatchNos.add(""+(getPreDayNum()+"-"+serialN));//
	    				}
	    				
	    			}
	    		}
	    	}else{
	    		Thread.sleep(10000);
	    		getLotteryRes();
	    	}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	}
	@Scheduled(cron="30 3/10 0,1,22,23 * * *")  
	public void uncatchResolve(){
		System.out.println("开始处理没有采集到的10分钟一次");
		for(String serialno:unCatchNos){
			querys.put("issueno", serialno);
			try {
				HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
				String ret = EntityUtils.toString(response.getEntity());
		    	JSONObject resJson = JSONObject.parseObject(ret);
		    	if("ok".equals(resJson.getString("msg"))){
		    		JSONObject resultJson = resJson.getJSONObject("result");
		    		String issueno2 = resultJson.getString("issueno");
		    		String resString2 = resultJson.getString("number");
		    		int point1=0,point2=0,point3=0,point4=0,point5=0;
		    		long serialNum = Long.parseLong(serialno);
		    		String[] res = resString2.split(" ");
		    		point1+=Integer.parseInt(res[0]);
		    		point2+=Integer.parseInt(res[1]);
		    		point3+=Integer.parseInt(res[2]);
		    		point4+=Integer.parseInt(res[3]);
		    		point5+=Integer.parseInt(res[4]);
		    		
		    		ResultLot lot = new ResultLot();
		    		lot.setLotid(0);
		    		long now = new Date().getTime();
		    		now = now-now%(1000*60*5);
		    		lot.setOpentime(new Date(now));
		    		long totalRes = 1;
		    		serialNum = Long.parseLong(issueno.replace("-", ""));
		    		lot.setSerialnum(serialNum);
		    		String lotString = ""+point1+","+point2+","+point3+","+point4+","+point5;
		    		lot.setResult(lotString);
		    		lotResultService.insertResultLot(lot);
		    		//增加开奖处理
		    		int result = point1+point2+point3+point4+point5;//大小单双分别是1，2，3，4
		    		int type1 = 0,type2 = 0,type3=0,type4=0,type5=0,type6=0,type7=0,type8=0,type9=0,type10=0,type11=0,type12=0;//type1大小type2单双
		    		if(result%2==0)
		    			type2 = 7;
		    		else
		    			type2 = 5;
		    		if(result>22)
		    			type1=2;
		    		else
		    			type1=3;
		    		
		    		if(point1%2==0)
		    			type4 = 19;
		    		else
		    			type4 = 17;
		    		if(point1>4)
		    			type3=11;
		    		else
		    			type3=13;
		    		
		    		if(point2%2==0)
		    			type6 = 37;
		    		else
		    			type6 = 31;
		    		if(point2>4)
		    			type5=23;
		    		else
		    			type5=29;
		    		
		    		if(point3%2==0)
		    			type8 = 53;
		    		else
		    			type8 = 47;
		    		if(point3>4)
		    			type7=41;
		    		else
		    			type7=43;
		    		
		    		if(point4%2==0)
		    			type10 = 71;
		    		else
		    			type10 = 67;
		    		if(point4>4)
		    			type9=59;
		    		else
		    			type9=61;
		    		
		    		if(point5%2==0)
		    			type12 = 89;
		    		else
		    			type12 = 83;
		    		if(point5>4)
		    			type11=73;
		    		else
		    			type11=79;

		    		totalRes = type1*type2*type3*type4*type5*type6*type7*type8*type9*type10*type11*type12;
		    		Map<String,Object> map = new HashMap<>();
		    		map.put("serialNum", serialNum);
		    		map.put("lotId", 0);
		    		map.put("type0", totalRes);
		    		map.put("type1", type1);
		    		map.put("type2", type2);
		    		map.put("type3", type3);
		    		map.put("type4", type4);
		    		map.put("type5", type5);
		    		map.put("type6", type6);
		    		
		    		map.put("type7", type7);
		    		map.put("type8", type8);
		    		map.put("type9", type9);
		    		map.put("type10", type10);
		    		map.put("type11", type11);
		    		map.put("type12", type12);
		    		map.put("lotResult", lotString);
		    		lotResultService.openLotProcess(map);
		    		lotResultService.getRecentBetlogLotWinner();//开奖后更新开奖结果
		    	}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		querys.remove("issueno");
		unCatchNos.clear();
	}
	

	public void craw(){
		ManagerController.status = 1;
		long serialNum = 0;
		getLotteryRes();
		//处理开奖结果
		int point1=0,point2=0,point3=0,point4=0,point5=0;
		String[] res = resString.split(" ");
		point1+=Integer.parseInt(res[0]);
		point2+=Integer.parseInt(res[1]);
		point3+=Integer.parseInt(res[2]);
		point4+=Integer.parseInt(res[3]);
		point5+=Integer.parseInt(res[4]);
		
		ResultLot lot = new ResultLot();
		lot.setLotid(0);
		long now = new Date().getTime();
		now = now-now%(1000*60*5);
		lot.setOpentime(new Date(now));
		long totalRes = 1;
		serialNum = Long.parseLong(issueno.replace("-", ""));
		lot.setSerialnum(serialNum);
		String lotString = ""+point1+","+point2+","+point3+","+point4+","+point5;
		lot.setResult(lotString);
		lotResultService.insertResultLot(lot);
		//增加开奖处理
		int result = point1+point2+point3+point4+point5;//大小单双分别是1，2，3，4
		int type1 = 0,type2 = 0,type3=0,type4=0,type5=0,type6=0,type7=0,type8=0,type9=0,type10=0,type11=0,type12=0;//type1大小type2单双
		if(result%2==0)
			type2 = 7;
		else
			type2 = 5;
		if(result>22)
			type1=2;
		else
			type1=3;
		
		if(point1%2==0)
			type4 = 19;
		else
			type4 = 17;
		if(point1>4)
			type3=11;
		else
			type3=13;
		
		if(point2%2==0)
			type6 = 37;
		else
			type6 = 31;
		if(point2>4)
			type5=23;
		else
			type5=29;
		
		if(point3%2==0)
			type8 = 53;
		else
			type8 = 47;
		if(point3>4)
			type7=41;
		else
			type7=43;
		
		if(point4%2==0)
			type10 = 71;
		else
			type10 = 67;
		if(point4>4)
			type9=59;
		else
			type9=61;
		
		if(point5%2==0)
			type12 = 89;
		else
			type12 = 83;
		if(point5>4)
			type11=73;
		else
			type11=79;

		totalRes = type1*type2*type3*type4*type5*type6*type7*type8*type9*type10*type11*type12;
		Map<String,Object> map = new HashMap<>();
		map.put("serialNum", serialNum);
		map.put("lotId", 0);
		map.put("type0", totalRes);
		map.put("type1", type1);
		map.put("type2", type2);
		map.put("type3", type3);
		map.put("type4", type4);
		map.put("type5", type5);
		map.put("type6", type6);
		
		map.put("type7", type7);
		map.put("type8", type8);
		map.put("type9", type9);
		map.put("type10", type10);
		map.put("type11", type11);
		map.put("type12", type12);
		map.put("lotResult", lotString);
		lotResultService.openLotProcess(map);
		lotResultService.getRecentBetlogLotWinner();//开奖后更新开奖结果
		ManagerController.curBet.clear();
		ManagerController.betlogs.clear();
		ManagerController.managerLeftcard.clear();
	}
	public static long getCurrentDayNum(){
		String a = format.format(new Date());
		return Long.parseLong(a);
	}
	
	private static long getPreDayNum() {
		long preNow = new Date().getTime()-86400000;
		String a = format.format(new Date(preNow));
		return Long.parseLong(a);
	}
	
	public static void main(String[] args){
//		System.out.println(getCurrentDayNum());
//		String resString="";
//		HtmlPage page1;
//		try {
//			page1 = (HtmlPage)webClient.getPage("http://danishlotto.com/");
//		
//		List<?> tables = page1.getByXPath("//*[@id=\"tab_conbox\"]/li[4]/table/tbody/tr/td[2]/table/tbody/tr[2]");
//		HtmlTableRow row = (HtmlTableRow)tables.get(0);
//		Iterator<DomElement> iter = row.getChildElements().iterator();
//		int flag = 0,serialNum = 0;
//		
//		while(iter.hasNext()){
//			DomElement str = (DomElement) iter.next();
//			if(flag==0)
//				serialNum = Integer.parseInt(str.getFirstChild().getNodeValue().trim());
//			else{
//	        String tmp = str.asXml();
//	        tmp = tmp.replace("<td>", "");
//	        tmp = tmp.replace("</td>", "");
//	        tmp = tmp.replace("<br/>", "");
//	        tmp = tmp.replace("\r\n", "");
//	        tmp = tmp.replace(" ", "");
//	        tmp = tmp.trim();
//	        resString = tmp;
//			}
//	        flag++;
//	   }
//		
//		} catch (FailingHttpStatusCodeException | IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		System.out.println(resString);
	}
}
