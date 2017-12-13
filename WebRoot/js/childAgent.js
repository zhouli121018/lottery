/**
 * Created by Administrator on 2017-08-30.
 */
$("#childAgentFoot").load("foot.jsp",function(){
	$("#footer li:nth-child(4)").addClass('active');
})
$("#tab-title").on('click','button',function(){
    $(this).addClass('active').siblings().removeClass('active');
    var id=$(this).attr('title');
    $(id).css('display','block').siblings().css('display','none');
})
