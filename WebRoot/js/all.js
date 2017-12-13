/**
 * Created by Administrator on 2017-08-29.
 */
if(!sessionStorage['openId']){
	location.href="http://nds.waleqp.com/lot/wxLogin.jsp";
}
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "H+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
var path=sessionStorage['basePath'];
$(function() {
    function getNowTime() {
    	$.ajax({
    		url:path+"manager/getRecentLotResult?num=1",
            data:'',
            success:function(data){
            	var obj= JSON.parse(data);
            	var nowTime=parseInt(obj.nowTime);
            	var newserialnum=obj.curNum;
            	//console.log(nowTime,newserialnum);
                 var m = parseInt(nowTime/60);
                 var s = nowTime - m * 60;
                 if (m < 10) {
                     m = "0" + m;
                 }
                 if (s < 10) {
                     s = "0" + s;
                 }
                 var html = m + ":" + s + "." + "00";
                 //console.log(html);
                 $('.nowTime').html(html);
                 $('.newserialnum').html(newserialnum);
                 
            }
    	})
    };
    //getNowTime();
    var uuid=sessionStorage['uuid'];
    jQuery.fn.getMyRedCard=function(){
    		$.ajax({
    			url:path+"manager/getRecentBet",
    			data:{uuid:sessionStorage['uuid'],pageNum:1},
    			success:function(data){
    				var list = JSON.parse(data);
    	            console.dir(list.redCard);
    	            $(".myredcard").html(list.redCard);
    			}
    		})
    }
    jQuery.fn.getNowTime=function (){
    	$.ajax({
    		url:path+"manager/getRecentLotResult?num=1",
            data:'',
            success:function(data){
            	var obj= JSON.parse(data);
            	var nowTime=parseInt(obj.nowTime);
            	var newserialnum=obj.curNum;
            	console.log(nowTime,newserialnum);
                 var m = parseInt(nowTime/60);
                 var s = nowTime - m * 60;
                 if (m < 10) {
                     m = "0" + m;
                 }
                 if (s < 10) {
                     s = "0" + s;
                 }
                 var html = m + ":" + s + "." + "00";
                 console.log(html);
                 $('.nowTime').html(html);
                 $('.newserialnum').html(newserialnum);
            }
    	})
    	
    };


    $('body').on('click','#footer li a',function(e){
        e.preventDefault();
        $(this).parent().addClass('active').siblings().removeClass('active');
        var id=$(this).attr('href').slice(1);
        console.log(id);
        location.href=id+".jsp";

    });

});

