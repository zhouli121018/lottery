/**
 * Created by Administrator on 2017-08-30.
 */
var uuid = sessionStorage['uuid'];
var path=sessionStorage['basePath'];
function getMyRedCard(){
	$.ajax({
		url:path+"manager/getRecentBet",
		data:{uuid:uuid,pageNum:1},
		success:function(data){
			var list = JSON.parse(data);
            console.dir(list.redCard);
            $(".myredcard").html(list.redCard);
		}
	})
}
$(function(){
	$("#exchangefoot").load("foot.jsp");
	getMyRedCard();

  if($('#exchange-left .order-list .order-item.check').length==0){
      $('#exchange-left .sell-btn').removeClass('active');
  }else{
      $('#exchange-left .sell-btn').addClass('active');
  }
  
  
  var pageNum=10;
  function getExchangeLog(){
	  $.ajax({
			url:path+"manager/getRecentExchangeLot?uuid="+uuid+"&pageNum="+pageNum,
			success:function(data){
				var list0 = JSON.parse(data);
	    	    console.dir(list0);
	    	    var list=list0.exchangeLot;
	    	    for(var i=0,html='';i<list.length;i++){
	    	    	var o=list[i];
	    	    	
	    	    	var src='';
	    	    	if(o.facevalue==20){
	    	    		src='images/20.png';
	    	    	}else if(o.facevalue==50){
	    	    		src='images/50.png';
	    	    	}else if(o.facevalue==100){
	    	    		src='images/100.png';
	    	    	}else if(o.facevalue==200){
	    	    		src='images/200.png';
	    	    	}else if(o.facevalue==500){
	    	    		src='images/500.png';
	    	    	}else if(o.facevalue==1000){
	    	    		src='images/1000.png';
	    	    	}
	    	    	html+=`<div class="row">
	                <div class="col-xs-5">
	           		<img  src="${src}" class="img-responsive">
	           </div>
	           <div class="col-xs-7">
	               <p>京东卡-面值${o.facevalue}元</p>
	               <p>数量：<b>${o.cardcount}</b> 张</p>
	               <p>金额：<b>${o.facevalue*o.cardcount}</b>元</p>
	               <p>${new Date(o.createtime).Format("yyyy-MM-dd HH:mm:ss")}</p>
	           </div>
	        </div>`;
	    	    }
	    	    $('#exchange-detail').html(html);
	    	    $('#exchange-detail').append(`<div class="row hasMore"><div class="col-xs-12">点击加载更多</div></div>`)
	    	    if(list.length<pageNum){
                    $('#exchange-detail .hasMore>div').html('—— 不要拉了 只有这些商品 ——');
                    $('#exchange-detail .hasMore').addClass('disable');
                }
	    	    
			}
		})
  }
  $("#order-top .top-item[title='#exchange-detail']").click(function(){
	  getExchangeLog();
  })
  $("#exchange-detail").on('click','div.hasMore',function(){
	  if($(this).hasClass('disable')){
		  return;
	  }else{
		  pageNum+=5;
		  getExchangeLog();  
	  }
	 
  })
  
		
	

});
$('#order-top').on('click','div.top-item',function(e){
    e.preventDefault();
    $(this).addClass('active').siblings().removeClass('active');
    var id=$(this).attr('title');
    $(id).css('display','block').siblings().css('display','none');

});
$('#exchange-left .order-list').on('click','.input-group span',function(){
	var n=parseInt($(this).parent().find('input').val());
	var facevalue=$(this).parents('.order-item').find('img').attr('alt');
	//console.log(n);
	if($(this).html()=="-"){
		n--;
		if(n==0)n=1;
		$(this).parent().find('input').val(n);
		$(this).parents('.col-xs-5').find('.order-exchange-middle b').html(facevalue*n*10);
	}else if($(this).html()=="+"){
		n++;
		$(this).parent().find('input').val(n);
		$(this).parents('.col-xs-5').find('.order-exchange-middle b').html(facevalue*n*10);
	}
	
})
$('#exchange-left .order-list').on('change','.input-group input',function(){
	var n=parseInt($(this).val());
	var facevalue=$(this).parents('.order-item').find('img').attr('alt');
	//console.log(n);
	if(n<=0){
		alert("请输入正确的数字！");
		$(this).val(1);	
		$(this).parents('.col-xs-5').find('.order-exchange-middle b').html(facevalue*10);
	}else{
		$(this).parents('.col-xs-5').find('.order-exchange-middle b').html(facevalue*n*10);
	};
})


$('#exchange-left .order-list').on('click','.order-item button',function(){
	var facevalue=$(this).parents('.order-item').find('img').attr('alt');
	var amount=$(this).parents('.order-item').find('.order-exchange-middle b').html();
	var cardcount=$(this).parents('.order-item').find('.input-group input').val();
	var myredcard=parseInt($('.mycharge .myredcard').html());
	console.log(amount>myredcard);
	if(amount>myredcard){
		alert('剩余钻石不足！');
		return;
	}
	if(confirm("确定要兑换吗？")){
		$.ajax({
			url:path+"manager/exchangeLot",
			data:{
				uuid:uuid,
				amount:amount,
				facevalue:facevalue,
				cardcount:cardcount
			},
			success:function(data){
				var res=JSON.parse(data);
				if(res.result){
					alert('兑换成功！')
				}else{
					alert('兑换失败！');
				}
				console.log("data:"+data);
				getMyRedCard();
			}
		})
	}
})



