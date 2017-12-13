/**
 * Created by Administrator on 2017-08-30.
 */

$("#moneyFoot").load("foot.jsp",function(){
	$("#footer").css("background","#fff");
	$("#footer li:nth-child(3)").addClass("active");
})
$('.remain').click(function(e){
    e.preventDefault();
    location.href='wallet.jsp';
});
$('.agent').click(function(e){
    e.preventDefault();
    location.href='agent.jsp';
});
$('.exchange').click(function(e){
    e.preventDefault();
    location.href='exchange.jsp';
});
$(function(){
	var path=sessionStorage['basePath'];
	var uuid=sessionStorage['uuid'];
	var nickname=sessionStorage['nickname'];
	var headimgurl=sessionStorage['headimgurl'];
	$('#user-top .headimg').attr('src',headimgurl);
	$('#user-top .nickname').html(nickname);
	$('#user-top .idCode').html("ID:"+uuid);
	$.ajax({
		url:path+"manager/getRecentBet?uuid="+uuid+"&pageNum=1",
		success:function(data){
			var list = JSON.parse(data);
            console.dir(list.redCard);
            $("#redcard").html(list.redCard);
		}
	})
	
})