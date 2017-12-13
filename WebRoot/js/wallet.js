$('.wallet-bottom button.charge').click(function(){
	location.href="charge.jsp";
})
$('.wallet-bottom button.exchange').click(function(){
	location.href="exchange.jsp";
})
$(function(){
	var path=sessionStorage['basePath'];
	var uuid=sessionStorage['uuid'];
	$.ajax({
		url:path+"manager/getRecentBet?uuid="+uuid+"&pageNum=1",
		success:function(data){
			var list = JSON.parse(data);
            console.dir(list.redCard);
            $("#redcard").html(list.redCard);
		}
	})
})


