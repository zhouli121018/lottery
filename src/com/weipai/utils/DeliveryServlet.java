package com.weipai.utils;

import com.weipai.model.Account;
import com.weipai.model.Paylog;
import com.weipai.service.AccountService;
import com.weipai.service.PaylogService;
import com.weipai.utils.Futil;

import net.sf.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by westlake on 2017/6/2.
 */

public class DeliveryServlet extends HttpServlet {
    private static JSONObject CONFIG_MAP;
    private final static String CONFIG_FILE = "productConfig.json";
    private final static String KEY_NAME = "DKEY";
    @Autowired
	private AccountService accountService;
    @Autowired
	private PaylogService paylogService;
    static {

        ClassLoader loader = DeliveryServlet.class.getClassLoader();
        InputStream is = loader.getResourceAsStream(CONFIG_FILE);

        BufferedReader in = new BufferedReader(new InputStreamReader(is));

        String s;
        StringBuilder sb = new StringBuilder();

        try {
            while ((s = in.readLine()) != null)
                sb.append(s + "\n");
            in.close();

            System.out.println(sb.toString());

            if (sb.toString() == null || sb.toString().isEmpty()) {
                System.out.println("productConfig.json is not right");
            }

            CONFIG_MAP = JSONObject.fromObject(sb.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("in DeliveryServlet-get");
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
                CONFIG_MAP == null ||
                !Futil.checkSign(xmlCnt, (String)CONFIG_MAP.get(KEY_NAME))) {
            returnCode = "FAIL";
        } else {
            int shiftcard = amount;
            Account account = accountService.selectByOpenId(userId);
                Map<String,Object> params = new HashMap<String,Object>();
                params.put("shiftCard", shiftcard);
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
            paylog.setPaytime(new Date(payTime));
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

    }
}
