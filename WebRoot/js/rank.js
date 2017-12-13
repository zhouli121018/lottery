/**
 * Created by Administrator on 2017-08-30.
 */
$("#rankFoot").load("foot.jsp",function(){
	$("#footer li:nth-child(3)").addClass('active');
})
$('#order-top').on('click','div.top-item',function(e){
    e.preventDefault();
    $(this).addClass('active').siblings().removeClass('active');
    var id=$(this).attr('title');
    $(id).css('display','block').siblings().css('display','none');
});

$("#tab-title").on('click','button',function(){
    $(this).addClass('active').siblings().removeClass('active');
})