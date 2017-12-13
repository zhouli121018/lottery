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
  <title>个人中心</title>
  <script>
//    var useragent = navigator.userAgent;
//    if (useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
//      location.href='sorry.jsp';
//    }
  </script> 
</head>
<body style="background:#eee;">
<!--指定容器-->
<div class="container-fluid" id="makeMoney">
  <div id="user-top">
<!--     <a href="exchangeDetail.jsp"><p class="text-right">资金明细&gt;</p></a> -->
    <div class="row">
      <div class="col-xs-3">
        <img src="images/0.jpg" class="img-responsive text-right headimg" alt="0"/>
      </div>
      <div class="col-xs-3">
        <p class="nickname">Jaly</p>
        <p class="idCode">ID:9666</p>
      </div>
      <div class="col-xs-3 col-xs-offset-3">
        <p id="myqrcode">
          <img src="images/myqrcode.png" alt="1" class="img-responsive qcode"/>
        </p>
        <p class="myCode">我的二维码</p>
      </div>
    </div>
  </div>
  <div id="user-body">
    <div class="remain">
      <div>
        <span class="glyphicon glyphicon-credit-card"></span>
        <b>我的钻石</b>
      </div>
      <div class="row">
        <div class="col-xs-6" id="redcard">0</div>
        <div class="col-xs-6 text-right">
          <a href="#">点击提现</a>
        </div>
      </div>
    </div>
    <div class="agent" style="display:none;">
      <div>
        <span class="glyphicon glyphicon-yen"></span>
        <b>代理佣金</b>
      </div>
      <div class="row">
        <div class="col-xs-6">0.00</div>
        <div class="col-xs-6 text-right">
          <a href="#">查看明细</a>
        </div>
      </div>
    </div>
    <div class="exchange">
      <div>
        <span class="glyphicon glyphicon-transfer"></span>
        <b>兑奖中心</b>
      </div>
      <div class="row">
        <div class="col-xs-12 text-right">
          <a href="#">点击兑奖</a>
        </div>
      </div>
    </div>
  </div>

  <!--<p class="hasMore">—— 不要拉了 只有这些商品 ——</p>-->
   
    <div id="moneyFoot"></div>
    
    <div id = "qrcodeid"></div>
    
    <div class="modal" id="myModal" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">长按分享</h4>
	      </div>
	      <div class="modal-body">
	           <img id='imgOne'  class="img-responsive"/> 
	      </div>
	    </div>
	  </div>
    </div>
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/money.js"></script>
<script type="text/javascript" src="js/jquery.qrcode.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
$('#myModal .close').click(function(){
	$("#myModal").hide();
})
function utf16to8(str) { //解决中文乱码
    var out, i, len, c;
    out = "";
    len = str.length;
    for(i = 0; i < len; i++) {
        c = str.charCodeAt(i);
        if ((c >= 0x0001) && (c <= 0x007F)) {
            out += str.charAt(i);
        } else if (c > 0x07FF) {
            out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
            out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
            out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
        } else {
            out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
            out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
        }
    }
    return out;
}
//此处生成名片二维码（如要生成普通链接二维码 则 “text”参数值 直接替换成普通链接即可）
    $.ajax({
    	url:sessionStorage['basePath']+"manager/selectInviteCodeByUuid",
    	data:{uuid:sessionStorage['uuid']},
    	success:function(data){
    		var res = JSON.parse(data);
    		console.dir(res);
    		var the_text ="http://www.wale28.com/lot/wxLogin.jsp" ;
    		if(res.status>0){
        		the_text += "?inviteCode="+res.inviteCode+"&managerId="+res.managerId;
        		$('#myqrcode').click(function(){
        			$('#myModal').fadeIn();
        		})
    		}else{
    			$('#myqrcode').click(function(){
        			alert(res.msg);
        			//$('#myModal').fadeIn();
        		})
    		}
			 the_text = utf16to8(the_text);
    		 var qrcode = jQuery('#qrcodeid').qrcode({
    		    width:200,
    		    height:200,
    		    render:"canvas", //设置渲染方式 table canvas
    		    typeNumber : -1,  //计算模式
    		    correctLevel  : 0,//纠错等级
    		    background   : "#ffffff",//背景颜色
    		    foreground   : "#000000",//前景颜色
    		    text:the_text
    		}).hide();
    		 var canvas=qrcode.find('canvas').get(0);  
    		 $('#imgOne').attr('src',canvas.toDataURL('image/jpg')) 
    		
    		
    	}
    })
   

</script>
</body>
</html>