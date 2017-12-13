<%@ page language="java" import="java.util.*,com.weipai.model.Manager" pageEncoding="utf-8"%>
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
%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>我的钻石</title>
</head>
<body>
<!--指定容器-->
<div class="container-fluid">
 <div class="wallet-top">
   <h1 class="text-center" id="redcard">0</h1>
   <p class="text-center">我的钻石</p>
 </div>

 <div class="wallet-bottom">
   <button class="btn btn-block charge">充值</button>
   <button class="btn btn-block exchange">兑换</button>
 </div>
<!--   <div class="text-center card"> -->
<!--     <span class="glyphicon glyphicon-credit-card"></span> -->
<!--     银行卡管理 -->
<!--   </div> -->
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/wallet.js"></script>
</body>
</html>