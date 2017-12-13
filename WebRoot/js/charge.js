$('#charge .charge-detail').on('click','div.row',function(){
	$(this).addClass('check').siblings().removeClass('check');
})
$('#charge .pay-type').on('click','div.row',function(){
	$(this).addClass('check').siblings().removeClass('check');
})
$('#charge .sure-charge button').click(function(){
    var money = $('#charge .charge-detail .row.check').attr('title');
    var type = $('#charge .pay-type .row.check').attr('title');
	console.log(money,type);
//	if(type=='ZWAP'){
//		   var useragent = navigator.userAgent;
//		   if (useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
//		   }else{
//			 alert('请点击右上角在浏览器中打开！');
//			 return;
//		   }
//	}

	function callback(data){
		console.log(data);
	}
	var productId=0;
	if(money==11){
		productId=1011;
	}else if(money==22){
		productId=1022;
	}else if(money==55){
		productId=1055;
	}else if(money==110){
		productId=1110;
	}else if(money==550){
		productId=1550;
	}
	var uuid=sessionStorage['uuid'];
	var openid=sessionStorage['openId'];
	//var uuid=136745;
    function qxpay(){
    	//alert('http://www.qhlongqing.com/pay/qxpay?userId='+openid+'&money='+money*100+'&productId='+productId+'&type='+type+'&gameType=13');
    	$.ajax({
 		   type: 'get',
 		   async: false,
 		   url: 'http://iosapp.qhlongqing.com/pay/qxpay?userId='+openid+'&money='+money*100+'&productId='+productId+'&type='+type+'&gameType=13',
 		   dataType: 'jsonp',
 		   jsonp: 'callback',
 		   success: function(json){
 			    console.log(json);
 			    
// 			    alert(json.paramStr);
 			    var random=encodeURIComponent(json.paramStr);
 			   // alert(json.paramStr);
// 			    var random=json.paramStr;
 			    $.ajax({
 			    	url:'https://pay.iquxun.cn/aiJinFuPay/aliScanPay.do?paramStr='+random,
 			    	success:function(data){
// 			    		 {"resultCode":"200", "Data":{"qr_code":"xxxxx"}}
 			    		console.log(data);
 			    		//alert(json2str(data));
 			    		 if(data.resultCode==200){
 			    			 console.log(data.Data.qr_code)
 			    			 location.href=data.Data.qr_code;
 			    		 }else{
 			    			 alert(data.message);
 			    		 }

 			    	}
 			    })
 		   },
 		   error: function(){
 				//console.log(arguments);
 			    alert('fail');
 		   }
     });
    }
    
    function json2str(o) { 
    	var arr = []; 
    	var fmt = function(s) { 
    	if (typeof s == 'object' && s != null) return json2str(s); 
    	return /^(string|number)$/.test(typeof s) ? "'" + s + "'" : s; 
    	} 
    	for (var i in o) arr.push("'" + i + "':" + fmt(o[i])); 
    	return '{' + arr.join(',') + '}'; 
    	} 
    
    
    function tcpay(){
    	$.ajax({
 		   type: 'get',
 		   async: false,
 		   url: 'http://www.qhlongqing.com/pay/tcpay?userId='+uuid+'&money='+money*100+'&productId='+productId+'&type='+type,
 		   dataType: 'jsonp',
 		   jsonp: 'callback',
 		   success: function(result){
 			    console.log(result);
// 			    for(var key in result){
// 			    	result[key]=encodeURIComponent(result[key]);
// 			    };
 			    console.log(result);
 			    $.ajax({
 			    	url:'https://pay.tongcaipay.com/pay/order',
 			    	data:result,
 			    	success:function(json){
 			    		console.log(json);
 			    		var data = JSON.parse(json);
 			    		 if(data.url){
 			    			 console.log(data.url)
 			    			 location.href=data.url;
 			    		 }else{
 			    			qxpay();
 			    		 }
 			    	}
 			    })
 		   },
 		   error: function(){
 				//console.log(arguments);
 			    alert('fail');
 		   }
     });
    }
    qxpay();
    //tcpay();
	var str0=encodeURIComponent('appKey=1f1b248ac40e6b1973aa297ada8ceadb&bussOrderNum=201709111417087084&channel=1&notifyUrl=http://www.qhlongqing.com/pay/qxnotify&orderName=青铜礼包&payMoney=11.0&remark=101110135818&returnUrl=http://www.qhlongqing.com/pay/aa.html&sign=a6e04939393e4e57e2a347d4a11f05b9');
	var str=encodeURI('appKey=1f1b248ac40e6b1973aa297ada8ceadb&bussOrderNum=201709111417087084&channel=1&notifyUrl=http://www.qhlongqing.com/pay/qxnotify&orderName=青铜礼包&payMoney=11.0&remark=101110135818&returnUrl=http://www.qhlongqing.com/pay/aa.html&sign=a6e04939393e4e57e2a347d4a11f05b9');
 
})



