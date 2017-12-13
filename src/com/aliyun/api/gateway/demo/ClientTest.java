package com.aliyun.api.gateway.demo;

import java.util.HashMap;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.api.gateway.demo.util.HttpUtils;

public class ClientTest {

	public static void main(String[] args) {
	    String host = "http://jisucpkj.market.alicloudapi.com";
	    String path = "/caipiao/query";
	    String method = "GET";
	    String appcode = "e3248566fb5c44f4a03507bffeebca1d";
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("caipiaoid", "73");
//	    querys.put("issueno", "20171103-071");


	    try {
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
	    	*/
	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
//	    	System.out.println(response.toString());
	    	//获取response的body
//	    	System.out.println(EntityUtils.toString(response.getEntity()));
	    	String res = EntityUtils.toString(response.getEntity());
	    	System.out.println(res);
	    	JSONObject resJson = JSONObject.parseObject(res);
	    	if("ok".equals(resJson.getString("msg"))){
	    		JSONObject result = resJson.getJSONObject("result");
	    		String issueno = result.getString("issueno");
	    		String number = result.getString("number");
	    		String opendate = result.getString("opendate");//"2017-11-03 16:31"
	    		System.out.println(issueno);
	    		System.out.println(number);
	    		System.out.println(opendate);
	    	}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	}

}
