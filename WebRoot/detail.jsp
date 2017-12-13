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
<head>
<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="expires" content="0">  
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<!--   <meta http-equiv="x-ua-compatible" content="IE=edge"> -->
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>挖乐28</title>
  <script>
//    var useragent = navigator.userAgent;
//    if (useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
//      location.href='sorry.jsp';
//    }
  </script>
</head>
<body>
<!--指定容器-->
<div class="container-fluid">
<div id="loading">
     <img alt="开奖中......" src="images/loading.gif" class="img-responsive">
  </div>
  <div id="detail">
    <div class="img-box">
      <img src="images/082819381459a400a6b1c30.jpg" alt="1" class="img-responsive dysimg"/>
    </div>
    <p class="title award-title">移动充值卡-50面值</p>
    <div class="row">
      <div class="col-xs-6">
        本期：<span class="newserialnum">218347</span>
      </div>
      <div class="col-xs-6">
        购买倒计时：<span class="timer nowTime">00:18.16</span>
      </div>
    </div>
<!--     <div class="buy-box"> -->
<!--       <div> -->
<!--         <span class="glyphicon glyphicon-certificate"></span>抢购记录 -->
<!--       </div> -->
<!--       <div class="row"> -->
<!--         <div class="col-xs-2"> -->
<!--           <img src="images/0.jpg" class="img-rounded img-responsive" alt="0"/> -->
<!--         </div> -->
<!--         <div class="col-xs-5"> -->
<!--           <p class="username">~高高~</p> -->
<!--           <p class="time">2017-08-30 09:25:21</p> -->
<!--         </div> -->
<!--         <div class="col-xs-5 text-right"> -->
<!--           抢购 <b>1</b> 张(双数) -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
    <div class="detail">
      <div>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
          <li class="active"><a href="#home" aria-controls="home" data-toggle="tab">商品介绍</a></li>
          <li><a href="#profile" aria-controls="profile"  data-toggle="tab">规格参数</a></li>
          <li><a href="#messages" aria-controls="messages"  data-toggle="tab">售后保障</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="home">
                 <img  src="images/introduce.png" class="img-responsive">
          </div>
          <div role="tabpanel" class="tab-pane" id="profile">
            <p>主体</p>
            <p>类型：实体卡</p>
            <!--<p>面值：<span>50</span></p>-->
            <p class="award-title">面值：50</p>
          </div>
          <div role="tabpanel" class="tab-pane" id="messages">

            <p>售后服务</p>
            <p>商品为在线充值卡或者实体购物卡，所有卡券均为不记名不挂失累卡券，请妥善保管，质保期：无质保。</p>
            <p>正品行货</p>
            <p>我司向您保证所售商品均为正品行货，商品均由指定供货商提供机打发票或电子发票。</p>
            <p>关于产品的补充说明</p>
            <p>注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</p>

          </div>
        </div>

      </div>
    </div>
    <div id="bottom" class="row navbar-fixed-bottom">
      <div class="col-xs-7 left">
        <u></u> <b><span class="price">28</span></b> 
      </div>
      <div class="col-xs-5 right text-center buy">
        马上抢
      </div>
    </div>

    <div id="modal">
      <div class="big"  >
        <div class="row modal-title">
          <div class="col-xs-3 img-title">
            <img src="images/082819381459a400a6b1c30.jpg" alt="1" class="img-responsive dysimg"/>
          </div>
          <div class="col-xs-6">
            <div>
              <b><span class="price">28</span></b> &nbsp; <u></u>
            </div>
            <div class="award-title">
              移动充值卡-50面值
            </div>
          </div>
          <div class="col-xs-3">
            <span class="close">&times;</span>
          </div>
        </div>
        <div class="modal-body row">
          <div class="col-xs-12 title">选择开奖数字</div>
          <div class="row">
            <div class="col-xs-3 col-xs-offset-3 text-center">
              <span class="check" title="3">小</span>
            </div>
            <div class="col-xs-3 text-center">
              <span title="2">大</span>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-3 col-xs-offset-3 text-center">
              <span title="5">单</span>
            </div>
            <div class="col-xs-3 text-center">
              <span title="7">双</span>
            </div>
          </div>

        </div>
        <div class="buy-count">
          <div class="title">选择购买数量</div>
          <ul class="clear">
            <li class="check">1</li>
            <li>3</li>
            <li>5</li>
            <li>10</li>
            <li>15</li>
            <li>30</li>
            <li>50</li>
            <li>100</li>
          </ul>
          <div class="input-group">
            <span class="input-group-addon btn">-</span>
            <input type="number" class="form-control text-center" min="0"  value="1" disabled/>
            <span class="input-group-addon btn">+</span>
          </div>
        </div>
        <div class="buy-bottom">
          <p>本次交易消耗<u></u>：<b><span class="price">28</span></b></p>
          <p>我的钻石：<b class="myredcard">0</b></p>
          <p>您将购买第 <span class="red newserialnum">218406</span> 期，本期购买剩余时间 <span class="red remain-time nowTime">02:18.58</span></p>
        </div>
        <div class="foot">
          <p class="buy charge">立即购买</p>
      </div>

      </div>
      <div class="bigOne" style="display:none;" >
        <div class="row modal-title">
          <div class="col-xs-3 img-title">
            <img src="images/082819381459a400a6b1c30.jpg" alt="1" class="img-responsive dysimg"/>
          </div>
          <div class="col-xs-6">
            <div>
              <b><span class="price">28</span></b> &nbsp;<u></u>
            </div>
            <div class="award-title">
              移动充值卡-50面值
            </div>
          </div>
          <div class="col-xs-3">
            <span class="close">&times;</span>
          </div>
        </div>
        <div class="modal-body row">
          <div class="col-xs-12 title">选择开奖数字</div>
          <div class="row">
            <div class="col-xs-3 col-xs-offset-3 text-center">
              <span class="check" title="51">大单</span>
            </div>
            <div class="col-xs-3 text-center">
              <span title="54">小双</span>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-3 col-xs-offset-3 text-center">
              <span title="53">小单</span>
            </div>
            <div class="col-xs-3 text-center">
              <span title="52">大双</span>
            </div>
          </div>

        </div>
        <div class="buy-count">
          <div class="title">选择购买数量</div>
          <ul class="clear">
            <li class="check">1</li>
            <li>3</li>
            <li>5</li>
            <li>10</li>
            <li>15</li>
            <li>30</li>
            <li>50</li>
            <li>100</li>
          </ul>
          <div class="input-group">
            <span class="input-group-addon btn">-</span>
            <input type="number" class="form-control text-center" min="0"  value="1" disabled />
            <span class="input-group-addon btn">+</span>
          </div>
        </div>
        <div class="buy-bottom">
          <p>本次交易消耗<u></u>：<b><span class="price">28</span></b></p>
          <p>我的钻石：<b class="myredcard">0</b></p>
          <p>您将购买第 <span class="red newserialnum">218406</span> 期，本期购买剩余时间 <span class="red remain-time nowTime">02:18.58</span></p>
        </div>
        <div class="foot">
          <p class="buy charge">立即购买</p>
        </div>

      </div>
      <div class="number" style="display:none;">
        <div class="row modal-title">
          <div class="col-xs-3 img-title">
            <img src="images/082819381459a400a6b1c30.jpg" alt="1" class="img-responsive dysimg"/>
          </div>
          <div class="col-xs-6">
            <div>
              <b><span class="price">28</span></b> &nbsp;<u></u>
            </div>
            <div class="award-title">
              移动充值卡-50面值
            </div>
          </div>
          <div class="col-xs-3">
            <span class="close">&times;</span>
          </div>
        </div>
        <div class="modal-body">
          <div class="row">
           <div class="col-xs-3 tnt text-center">
                        第1球:
            </div>
            <div class="col-xs-9">
              <div class="row">
              		<div class="col-xs-3 text-center">
		              <span class="check" title="11">大</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="13">小</span>
		            </div>
		            <div class="col-xs-3  text-center">
		              <span title="17">单</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="19">双</span>
		            </div>
              </div>
            </div>
          </div>
         
         <div class="row">
           <div class="col-xs-3 tnt text-center">
                        第2球:
            </div>
            <div class="col-xs-9">
              <div class="row">
              		<div class="col-xs-3  text-center">
		              <span  title="23">大</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="29">小</span>
		            </div>
		            <div class="col-xs-3  text-center">
		              <span title="31">单</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="37">双</span>
		            </div>
              </div>
            </div>
          </div>
          
          <div class="row">
           <div class="col-xs-3 tnt text-center">
                        第3球:
            </div>
            <div class="col-xs-9">
              <div class="row">
              		<div class="col-xs-3  text-center">
		              <span  title="41">大</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="43">小</span>
		            </div>
		            <div class="col-xs-3  text-center">
		              <span title="47">单</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="53">双</span>
		            </div>
              </div>
            </div>
          </div>
          
          <div class="row">
           <div class="col-xs-3 tnt text-center">
                        第4球:
            </div>
            <div class="col-xs-9">
              <div class="row">
              		<div class="col-xs-3 text-center">
		              <span  title="59">大</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="61">小</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="67">单</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="71">双</span>
		            </div>
              </div>
            </div>
          </div>
          
          <div class="row">
           <div class="col-xs-3 tnt text-center">
                        第5球:
            </div>
            <div class="col-xs-9">
              <div class="row">
              		<div class="col-xs-3 text-center">
		              <span title="73">大</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="79">小</span>
		            </div>
		            <div class="col-xs-3  text-center">
		              <span title="83">单</span>
		            </div>
		            <div class="col-xs-3 text-center">
		              <span title="89">双</span>
		            </div>
              </div>
            </div>
          </div>
          
        </div>
        <div class="buy-count">
          <div class="title">选择购买数量</div>
          <ul class="clear">
            <li class="check">1</li>
            <li>3</li>
            <li>5</li>
            <li>10</li>
            <li>15</li>
            <li>30</li>
            <li>50</li>
            <li>100</li>
          </ul>
          <div class="input-group">
            <span class="input-group-addon btn">-</span>
            <input type="number" class="form-control text-center"  min="0"  value="1" disabled/>
            <span class="input-group-addon btn">+</span>
          </div>
        </div>
        <div class="buy-bottom">
          <p>本次交易消耗<u></u>：<b><span class="pay price">11</span></b></p>
          <p>我的钻石：<b class="myredcard">0</b></p>
          <p>您将购买第 <span class="red newserialnum">218406</span> 期，本期购买剩余时间 <span class="red remain-time nowTime">02:18.58</span></p>
        </div>
        <div class="foot">
          <p class="buy charge">立即购买</p>
        </div>

      </div>
    </div>
  </div>


  
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/detail.js"></script>
</body>
</html>