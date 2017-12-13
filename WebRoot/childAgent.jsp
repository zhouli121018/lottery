<%@ page language="java" import="java.util.*,com.weipai.model.Manager" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>下级推广</title>
</head>
<body>
<!--指定容器-->
<div class="container-fluid">
  <div>
    
      <div id="tab-title" class="text-center">
        <div class="btn-group" role="group">
          <button type="button" class="btn btn-default active" title="#next-one">下1级推广</button>
          <button type="button" class="btn btn-default" title="#next-two">下2级推广</button>
          <button type="button" class="btn btn-default" title="#agent-detail">佣金详情</button>
        </div>
      </div>
      <div id="tips">
          <p>注：下1级佣金=下1级总投入额*3%</p>
          <p class="nextTwoAgent">  下2级佣金=下2级总投入额*2%</p>
      </div>
     
      <div id="tab-list" >
        <div id="next-one">
          <table class="table table-striped">
                        <thead>
	                        <tr>
	                            <th>昵称</th>
	                            <th>总投入额(元)</th>
	                            <th>获取佣金(元)</th>
	                        </tr>
                        </thead>
                        <tbody>
                           <tr>
	                            <td>一眼意中人</td>
	                            <td>1234.00</td>
	                            <td>888.00</td>
	                        </tr>
	                        <tr>
	                            <td>~~~~</td>
	                            <td>2345.00</td>
	                            <td>600.00</td>
	                        </tr>
	                        <tr>
	                            <td>昵称</td>
	                            <td>5678.00</td>
	                            <td>900.00</td>
	                        </tr>
                        </tbody>
           </table>
        </div>
        <div id="next-two">
            <table class="table  table-striped table-hover">
                        <thead>
	                        <tr>
	                            <th>昵称</th>
	                            <th>总投入额</th>
	                            <th>获取佣金</th>
	                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
           </table>
        </div>
        <div id="agent-detail">
           <table class="table  table-striped table-hover">
                        <thead>
	                        <tr>
	                            <th>日期</th>
	                            <th>获取佣金</th>
	                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
           </table>
        </div>
      </div>
  </div>
  <div id="childAgentFoot"></div>
</div>

<script src="js/jquery-1.11.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/all.js"></script>
<script src="js/childAgent.js"></script>
</body>
</html>