$('#order-top').on('click','div.top-item',function(e){
    e.preventDefault();
    $(this).addClass('active').siblings().removeClass('active');
    var id=$(this).attr('title');
    $(id).css('display','block').siblings().css('display','none');
});
var path=sessionStorage['basePath'];
var uuid=sessionStorage['uuid'];
$("#exchangeDetailFoot").load("foot.jsp");
$(function(){
	$.ajax({
		url:path+"manager/getRecentExchangeLot?uuid="+uuid,
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
    	    
		}
	})
})
