<%@ page language="java" import="java.util.*,com.weipai.model.Manager" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>分享有奖</title>
</head>
<body style="background:#eee;">
<!--指定容器-->
<div class="container-fluid">
   <div class="agent-top">
       <h4>可提现佣金</h4>
       <h2>0.00</h2>
       <button type="button" class="btn" data-toggle="modal" data-target="#myModal">提现到账户余额</button>
   </div>
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body text-center">
                    <div class="modal-top">
                        <span class="glyphicon glyphicon-ok"></span>
                        <h4>佣金成功打入您的账户余额</h4>
                    </div>
                    <div class="modal-middle">
                        <a href="#">账户明细</a>
                    </div>
                    <div class="modal-bottom">
                        <a href="money.jsp">个人中心</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center agent-mid">
        <p>我的推广数</p>
        <p class="agent-count">0</p>
        <button class="btn">查看详情</button>
    </div>
    <div class="agent-bottom text-center">
        <p>点击下面按钮，获得专属二维码，长按保存图片，分享到朋友圈，即将获得佣金，赶紧行动起来，给你的好友发送邀请吧！</p>
        <button class="btn">获取二维码</button>
    </div>
    <div id="agentfoot"></div>
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/agent.js"></script>
</body>
</html>