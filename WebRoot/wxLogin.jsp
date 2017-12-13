<%@ page language="java" import="java.util.*,com.weipai.model.Manager,com.weipai.utils.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String  url  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1);  	   
	if(request.getQueryString()!=null) 
	{   
	    url+="?"+request.getQueryString();           
	} 
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	if(code != null && !"".equals(code)) {
		  // 授权成功, 微信获取用户openID
		  OAuthInfo authInfo = HttpRequestUtil.getAccess_token(code);
		  String openId = authInfo.getOpenid();
		  String access_token = authInfo.getAccess_token();
		   
		  if(access_token == null) {
			  response.sendRedirect(HttpRequestUtil.getStartURLToGetCode());
		  }else{
			  request.getSession().setAttribute("access_token", access_token);
			  UserInfo userInfo = HttpRequestUtil.getUserInfo(openId, access_token);
			  //这段代码添加根据微信返回的用户信息获取用户在游戏中的各种信息，如UUID等，完成游戏登录
			  request.getSession().setAttribute("userInfo",userInfo);
			  //登录处理完成后跳转到实际的首页
			 // TicketInfo ticket = HttpRequestUtil.getJsapi_ticket(access_token);
			 // request.getSession().setAttribute("jsapi_ticket", ticket.getTicket());
		  }
		   
		  // 数据库中查询微信号是否绑定平台账号
		  System.out.println(openId);
  	      request.getSession().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		 } 
	else
		 response.sendRedirect(HttpRequestUtil.getStartURLToGetCode());
%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<!--   <meta http-equiv="x-ua-compatible" content="IE=edge"> -->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="css/index.css"/>
  <title>挖乐28</title>
  <script src="js/jquery-1.11.3.js"></script>
  <script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
  <script>
	  var obj = new WxLogin({
	      id:"login", 
	      appid: "wx6f1a7fce9cf8", 
	      scope: "snsapi_login", 
	      redirect_uri: "http://www.wale28.com/lot/wxLogin.jsp",
	      state: "",
	      style: "",
	      href: ""
	    });
  </script>
</head>
<body style="padding-top:30px;">
<!--指定容器-->
<div class="container-fluid">
    <div id="login">
        <img alt="1" src="images/waleqrcode.png" class="img-responsive">
    </div>
</div>


<script src="js/bootstrap.js"></script>
<!-- <script src="js/all.js"></script> -->
</body>
</html>