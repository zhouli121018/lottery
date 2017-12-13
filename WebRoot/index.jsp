<%@page import="com.weipai.utils.UserInfo"%>
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
	UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
	if(userInfo==null)
		response.sendRedirect("/wxLogin.jsp");
	String unionid =userInfo.getUnionid();
	String nickname =userInfo.getNickname();
	String headimgurl = userInfo.getHeadimgurl();
	String openid =userInfo.getOpenid();
	int sex =userInfo.getSex();
	String city =userInfo.getCity();
	String province =userInfo.getProvince();
	String managerId = request.getParameter("managerId");
	String openId = userInfo.getOpenid();
%>
<!DOCTYPE html>
<html>
<head lang="en">
<!-- 	<meta http-equiv="pragma" content="no-cache">   -->
<!-- 	<meta http-equiv="cache-control" content="no-cache">   -->
<!-- 	<meta http-equiv="expires" content="0"> -->
<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="expires" content="0">  
 	 <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<!--   <meta http-equiv="x-ua-compatible" content="IE=edge"> -->
<!--   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>挖乐28</title>
  <script src="js/jquery-1.11.3.js"></script>
  <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  <script>
	sessionStorage['basePath']="<%=basePath%>";
	var unionid = "<%=unionid%>";
//     var unionid = "oVQS0w7eLE-gGlthtgLsOcaNewW4";
	sessionStorage['openId']="<%=openId%>";
    sessionStorage['unionid'] = unionid;
	$.ajax({
		   url:"<%=basePath%>manager/getUuidByUnionid",
		   data:{
			   unionid:unionid,
			   nickname:"<%=nickname%>",
			   headimgurl:"<%=headimgurl%>",
			   openid:"<%=openid%>",
			   sex:"<%=sex%>",
			   city:"<%=city%>",
			   province:"<%=province%>",
			   managerId:"<%=managerId%>"
			   },
		   success:function(data){
			   var obj = JSON.parse(data);
			   console.log(obj.uuid);
			   if(obj.managerId){
				   sessionStorage['managerId']=obj.managerId;
			   }
			   else{
				   sessionStorage['managerId']=0;
			   }
			   sessionStorage['uuid']=obj.uuid;
			   sessionStorage['nickname']="<%=nickname%>";
			   sessionStorage['headimgurl']="<%=headimgurl%>";
// 			   sessionStorage['nickname']="这是昵称测试";
// 			   sessionStorage['headimgurl']="images/1.jpg";
              
		   }  
	})
	
</script>
</head>
<body style="padding-top:30px;">
<!--指定容器-->
<div class="container-fluid">
  <div id="loading">
     <img alt="开奖中......" src="images/loading.gif" class="img-responsive">
  </div>
  <div id="top" class="navbar-fixed-top">
    <span class="glyphicon glyphicon-volume-up navbar-fixed-top"></span>
    <div>
	     <ul class="clear">
	      <li>充值请联系客服，微信：youzhong23game001</li>
	      <li>充值请联系客服，微信：youzhong23game001</li>
	      <li>充值请联系客服，微信：youzhong23game001</li>
	    </ul>
    </div>
    
  </div>
  <div id="banner">
    <img src="images/ban.png" alt="banner" class="img-responsive"/>
<!--     <div class="text-center banner-charge"> -->
<!--       <p><b>888.00</b></p> -->
<!--       <a href="#" class="btn">充值</a> -->
<!--     </div> -->
    <div class="mycharge text-center">
	   <div>
	      <span class="mount-img"></span><b class="myredcard"></b><span class="glyphicon glyphicon-plus go-charge">点击充值</span>
	   </div>
    </div>
  </div>
  <div id="menu" class="clear">
    <div class="menu-item intro">
      <img src="images/banner_left.png" class="img-responsive" alt="left"/>
    </div>
    <div class="menu-item order">
      <img src="images/banner_right.png" class="img-responsive"  alt="right"/>
    </div>
  </div>
  <div class="open-tips text-center">
    <p class="to-left">每日开奖: 10:00-22:00(10分钟一期)</p>
    <p>22:00-02:00(5分钟一期)</p>
  </div>
  <p class="period text-center">- 第 <b class="newserialnum">2181964</b> 期 -</p>
  
  
  <!-- 列表-->
  <div class="list list-inset clear">
    <div class="">
      <div class="award-head">
        <div class="head-time">
        </div>
        <span class="time-read nowTime">02:54.35</span>
      </div>
      <div class="award-body-main clear">
        <div class="award-body left-body">
          <div class="award-img">
            <img src="images/s20.png" title="20" alt="1" class="img-responsive"/>
          </div>
          <div class="award-body-title">京东E卡经典卡-20面值</div>
          <div class="award-body-price">
            <span>
              <u></u>：<b>104</b>
            </span>
            <a href="#" class="go-buy">马上抢</a>
          </div>
        </div>
        <div class="award-body">
          <div class="award-img">
            <img src="images/1000.png" alt="2" title="1000" class="img-responsive"/>
          </div>
          <div class="award-body-title">京东E卡经典卡-1000面值</div>
          <div class="award-body-price">
            <span>
              <u></u>：<b>5200</b>
            </span>
            <a href="#" class="go-buy">马上抢</a>
          </div>
        </div>
<!--         <div class="award-body"> -->
<!--           <div class="award-img"> -->
<!--             <img src="images/08181844485996c52054c94.jpg" title="100" alt="4" class="img-responsive"/> -->
<!--           </div> -->
<!--           <div class="award-body-title">京东E卡经典卡-100面值</div> -->
<!--           <div class="award-body-price"> -->
<!--             <span> -->
<!--               <u></u>：<b>280</b> -->
<!--             </span> -->
<!--             <a href="#" class="go-buy">马上抢</a> -->
<!--           </div> -->
<!--         </div> -->
      </div>
    </div>
    <div class="">
      <div class="award-head">
        <span class="head-time"></span>
        <span class="time-read nowTime">00:54.35</span>
      </div>
      <div class="award-body-main clear">
        <div class="award-body left-body">
          <div class="award-img">
            <img src="images/20.png" alt="2" title="20" class="img-responsive"/>
          </div>
          <div class="award-body-title">京东E卡经典卡-20面值</div>
          <div class="award-body-price">
            <span>
             <u></u>：<b>104</b>
            </span>
            <a href="#" class="go-buy">马上抢</a>
          </div>
        </div>
        <div class="award-body">
          <div class="award-img">
            <img src="images/100.png" alt="2" title="100" class="img-responsive"/>
          </div>
          <div class="award-body-title">京东E卡经典卡-100面值</div>
          <div class="award-body-price">
            <span>
              <u></u>：<b>520</b>
            </span>
            <a href="#" class="go-buy">马上抢</a>
          </div>
        </div>
      </div>
    </div>
    <div class="">
      <div class="award-head">
        <span class="head-time"></span>
        <span class="time-read nowTime">00:54.35</span>
      </div>
      <div class="award-body-main clear">
        <div class="award-body left-body">
          <div class="award-img">
            <img src="images/200.png" alt="2" title="200" class="img-responsive"/>
          </div>
          <div class="award-body-title">京东E卡经典卡-200面值</div>
          <div class="award-body-price">
            <span>
              <u></u>：<b>1040</b>
            </span>
            <a href="#" class="go-buy">马上抢</a>
          </div>
        </div>
        <div class="award-body">
          <div class="award-img">
            <img src="images/500.png" alt="2" title="500" class="img-responsive"/>
          </div>
          <div class="award-body-title">京东E卡经典卡-500面值</div>
          <div class="award-body-price">
            <span>
             <u></u>：<b>2600</b>
            </span>
            <a href="#" class="go-buy">马上抢</a>
          </div>
        </div>
      </div>
    </div>
    

  </div>
  <p class="hasMore">—— 不要拉了 只有这些商品 ——</p>
    <div id="indexfoot"></div>
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/index.js"></script>

</body>
</html>