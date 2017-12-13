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
  <title>我的订单</title>
</head>
<body style="padding-top:50px;">
<!--指定容器-->
<div class="container-fluid">
  <div id="order-top" class="clear navbar-fixed-top">
    <div class="top-item active" title="#record">
      我的抢购记录
    </div>
    <div class="top-item" title="#open">
      丹麦28PC开奖
    </div>
  </div>
   <div id="order-body">
     <div id="record" class="clear">
       <div class="record-item">
         <div class="list">
           <div class="row">
             <div class="col-xs-6">订单编号：<span>208290</span></div>
             <div class="col-xs-6 text-right">2017-08-28 14:56:08</div>
           </div>

           <div class="row list-mid">
             <div class="col-xs-5">
               <img src="images/08181843255996c4cd92656.jpg" class="img-responsive" alt="0"/>
               <p>京东E卡经典卡50面值</p>
             </div>
             <div class="col-xs-7">
               <p>购买数字：</p>
               <div class="buy">
                 <span>小</span>
                 <span class="check success">大</span>
                 <span>单</span>
                 <span>双</span>
               </div>
               <div class="red">
                 获胜号码：4+1+4=9(小单)
               </div>
               <div>
                 <span>购买份数：<b>1</b></span>&nbsp;&nbsp;
                 <span>购买金额：<b>28</b></span>
               </div>
             </div>
           </div>
           <div class="row">
             <div class="col-xs-4">
               <p>开奖期号:<span>218668</span></p>
             </div>
             <div class="col-xs-5 success">
               <span></span>
               恭喜获胜
               <a href="exchange.html" class="btn success btn-sm">领取奖品</a>
             </div>
             <div class="col-xs-3 buy-again">
               <a href="index.html">再次购买</a>
             </div>
           </div>
         </div>
         <div class="list">
           <div class="row">
             <div class="col-xs-6">订单编号：<span>197838</span></div>
             <div class="col-xs-6 text-right">2017-08-28 14:56:08</div>
           </div>

           <div class="row list-mid">
             <div class="col-xs-5">
               <img src="images/08181843255996c4cd92656.jpg" class="img-responsive" alt="0"/>
               <p>京东E卡经典卡50面值</p>
             </div>
             <div class="col-xs-7">
               <p>购买数字：</p>
               <div class="buy">
                 <span>小</span>
                 <span class="check">大</span>
                 <span>单</span>
                 <span>双</span>
               </div>
               <div class="red">
                 获胜号码：4+1+4=9(小单)
               </div>
               <div>
                 <span>购买份数：<b>1</b></span>&nbsp;&nbsp;
                 <span>购买金额：<b>28</b></span>
               </div>
             </div>
           </div>
           <div class="row">
             <div class="col-xs-4">
               <p>开奖期号:<span>218668</span></p>
             </div>
             <div class="col-xs-5">
               <span></span>
               再接再厉
             </div>
             <div class="col-xs-3 buy-again">
               <a href="index.html">再次购买</a>
             </div>
           </div>
         </div>
         <div class="list">
           <div class="row">
             <div class="col-xs-6">订单编号：<span>197838</span></div>
             <div class="col-xs-6 text-right">2017-08-28 14:56:08</div>
           </div>

           <div class="row list-mid">
             <div class="col-xs-5">
               <img src="images/08181843255996c4cd92656.jpg" class="img-responsive" alt="0"/>
               <p>京东E卡经典卡50面值</p>
             </div>
             <div class="col-xs-7">
               <p>购买数字：</p>
               <div class="buy first-number">1:
                 <span>小</span>
                 <span class="check success">大</span>
                 <span>单</span>
                 <span>双</span>
               </div>
               <div class="buy second-number">2:
                 <span>小</span>
                 <span class="check">大</span>
                 <span>单</span>
                 <span>双</span>
               </div>
               <div class="buy third-number">3:
                 <span>小</span>
                 <span class="check">大</span>
                 <span>单</span>
                 <span>双</span>
               </div>
               <div class="buy fourth-number">4:
                 <span>小</span>
                 <span class="check">大</span>
                 <span>单</span>
                 <span>双</span>
               </div>
               <div class="buy fifth-number">5:
                 <span>小</span>
                 <span class="check">大</span>
                 <span>单</span>
                 <span>双</span>
               </div>
               <div class="red">
                 获胜号码：4+1+4=9(小单)
               </div>
               <div>
                 <span>购买份数：<b>1</b></span>&nbsp;&nbsp;
                 <span>购买金额：<b>28</b></span>
               </div>
             </div>
           </div>
           <div class="row">
             <div class="col-xs-4">
               <p>开奖期号:<span>218668</span></p>
             </div>
             <div class="col-xs-5">
               <span></span>
               再接再厉
             </div>
             <div class="col-xs-3 buy-again">
               <a href="index.html">再次购买</a>
             </div>
           </div>
         </div>
         
       </div>
       <p class="hasMore">—— 点击加载更多 ——</p>
     </div>
     <div id="open">
        <div class="title row">
          <div class="col-xs-4">
              <div class="wrap">
                <p>19:00-21:00</p>
                <p>不定期维护</p>
              </div>
          </div>
          <div class="col-xs-4">
              <div class="wrap">
                <p>0-22小数</p>
                <p>23-45大数</p>
              </div>
          </div>
          <div class="col-xs-4">
              <div class="wrap">
                <p>全天抢购</p>
                <p>5-10分钟开奖</p>
              </div>
          </div>

        </div>
        <div class="result">开奖结果</div>
        <div class="result-list">
          <div class="result-item row">
            <div class="col-xs-9">
              <div class="body-time">
                <span>2182119</span> 期
              </div>
              <div class="body-number">
                <b>4</b> +
                <b>9</b> +
                <b>4</b> +
                <b>4</b> +
                <b>9</b> =
                <b class="sum">14</b>
              </div>
            </div>
            <div class="col-xs-3">
              <div class="row">
                <div class="col-xs-3 ">
                  <span class="large">小</span>
                </div>
                <div class="col-xs-3 col-xs-offset-1">
                  <span class="double">双</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row hasMore">
          <div class="col-xs-12">
            点击加载更多
          </div>
        </div>
     </div>
   </div>
   <div id="orderFoot"></div>

</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/order.js"></script>
</body>
</html>