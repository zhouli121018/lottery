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
<div class="container-fluid" id="charge">
    
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">长按扫码</h4>
	      </div>
	      <div class="modal-body">
	           <img alt="service" src="images/service.jpg" class="img-responsive">
	      </div>
	      <div class="modal-footer">
	        充值微信号：zhouli08182648
	      </div>
	    </div>
	  </div>
    </div>
<!--     <h3 class="text-center"><span></span> 我的钻石：<b>0</b></h3> -->
    <div class="charge-detail">
      <p>充值</p> 
      <div>
          <div class="row" title="11">
	         <div class="col-xs-6 charge-left">
	            <span></span> 110
	         </div>
	         <div class="col-xs-6 text-right">
	            <button class="btn">￥11.00</button>
	         </div>
          </div>
	      <div class="row check" title="22">
	         <div class="col-xs-6 charge-left">
	            <span></span> 220
	         </div>
	         <div class="col-xs-6 text-right">
	            <button class="btn">￥22.00</button>
	         </div>
	      </div>
	      <div class="row" title="55">
	         <div class="col-xs-6 charge-left">
	            <span></span> 550
	         </div>
	         <div class="col-xs-6 text-right">
	            <button class="btn">￥55.00</button>
	         </div>
	      </div>
	      <div class="row" title="110">
	         <div class="col-xs-6 charge-left">
	            <span></span> 1100
	         </div>
	         <div class="col-xs-6 text-right">
	            <button class="btn">￥110.00</button>
	         </div>
	      </div>
	      <div class="row" title="550">
	         <div class="col-xs-6 charge-left">
	            <span></span> 5500
	         </div>
	         <div class="col-xs-6 text-right">
	            <button class="btn">￥550.00</button>
	         </div>
	      </div>
      </div>
      
    </div>
    <div class="pay-type">
          <p>支付方式</p>
          <div>
             <div class="row weixin check" title="WWAP">
		         <div class="col-xs-6"><span class="bg"></span> 微信支付</div>
		         <div class="col-xs-6 text-right">
		            <span class="glyphicon glyphicon-ok"></span>
		         </div>
		      </div>
		      <div class="row zhifubao" title="ZWAP" style="display:none;">
		         <div class="col-xs-6"><span class="bg"></span> 支付宝</div>
		         <div class="col-xs-6 text-right">
		            <span class="glyphicon glyphicon-ok"></span>
		         </div>
	          </div>
          </div>
    </div>
    <div class="text-center service"><button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-primary">添加客服微信充值</button></div>
    <div class="sure-charge text-center check">
        <button class="btn">充 值</button>
    </div>
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/charge.js"></script>
</body>
</html>