/**
 * Created by Administrator on 2017-08-30.
 */
var lastTime = +new Date;
	setInterval(function() {
	    if(Math.abs(+new Date - lastTime) > 3000) {
//	       alert("从后台切回！");
	    	$().getNowTime();
			$().getMyRedCard();
	    }
	    lastTime = +new Date;
	}, 1000);


$(function(){
	
	
	var uuid = sessionStorage['uuid'];
	var path=sessionStorage['basePath'];
	setTimeout(function(){
		$().getNowTime();
	},2000);
	function gettime(){
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
	             interval();
	        }
		})
	}
	gettime();
		function interval(){
	        clearInterval(timer);
	        var timer=null;
	        var NowTime = new Date();
	        var index=$('#detail span.timer').html();
	        var arr=index.split('.');
	        var subarr=arr[0].split(':');
	        console.log(subarr[0],subarr[1],arr[1]);
	        var EndTime=new Date(parseInt(subarr[0]*60*1000)+parseInt(subarr[1]*1000)+parseInt(arr[1]*10)+parseInt(NowTime.getTime()));
	        var EndTimeMsg = EndTime.getFullYear() + "";
	        EndTimeMsg = EndTimeMsg + (EndTime.getMonth() + 1) + "";
	        EndTimeMsg = EndTimeMsg + (EndTime.getDate()) + "";
	        EndTimeMsg = EndTimeMsg + (EndTime.getHours()) + "";
	        EndTimeMsg = EndTimeMsg + (EndTime.getMinutes()) + "";
	        EndTimeMsg = EndTimeMsg + (EndTime.getSeconds()) + "";
	        function GetRTime()
	        {
	            NowTime = new Date();
	            var nMS = EndTime.getTime() - NowTime.getTime();
	            var nD = Math.floor(nMS / (1000 * 60 * 60 * 24));
	            var nH = Math.floor(nMS / (1000 * 60 * 60)) % 24;
	            var nM = Math.floor(nMS / (1000 * 60)) % 60;
	            var nS = Math.floor(nMS / 1000) % 60;
	            var nSS = Math.floor(nMS /100) % 10;
	            if (nD >= 0)
	            {
	                if(nD<10){ nD = "0" + nD; }
	                if(nH<10){ nH = "0" + nH; }
	                if(nM<10){ nM = "0" + nM; }
	                if(nS<10){ nS = "0" + nS; }
	                if(nSS<10){nSS="0"+ nSS; }
	                $('#detail span.timer').html(nM+":"+nS+"."+nSS);
	                $('#modal .buy-bottom .remain-time').html(nM+":"+nS+"."+nSS);
	            }
	            else {
                     console.log("开奖中~~");
                     //$("#loading").show();
	            	 if(timer){
	                 	clearInterval(timer);
	                 	timer=false;
	                 }
	                 function getnew(){
	                 	 var serialnum=$('.newserialnum').html();
	                      var newserial=0;
	                	 $.ajax({
	                     	url:path+"manager/getRecentLotResult?num=1",
	                     	success:function(data){
	                     		var obj= JSON.parse(data);
	                         	newserial=obj.curNum;
	                         	if(parseInt(serialnum) < parseInt(newserial)){
	 	                        	if(getnewnum){
	 	                        		clearInterval(getnewnum);
	 	                        		getnewnum=false;
	 	                        	};
	 	                        	gettime();
	 	                        	$().getMyRedCard();
	 	                        	//$("#loading").hide();
	 	                            console.log(serialnum,newserial);
	                         	}
	                     	}
	                     })
	                 }
	                 var getnewnum=setInterval(getnew,3000);
	            }

	        }
	        timer=setInterval(GetRTime, 100);
	};
    // 对浏览器的UserAgent进行正则匹配，不含有微信独有标识的则为其他浏览器
    


    var n=sessionStorage['type'];
    if(n==1){
        $('#modal>.number').show().siblings().remove();
    }else if(n==4){
        $('#modal>.bigOne').show().siblings().remove();
    }else if(n==2){
        $('#modal>.big').show().siblings().remove();
    }
    var price=sessionStorage['price'];
    var imgsrc=sessionStorage['imgsrc'];
    var title=sessionStorage['title'];
    var facevalue=sessionStorage['facevalue'];
    $('#detail  img.dysimg').attr('src',imgsrc);
    $('#detail  img.dysimg').attr('alt',facevalue);
    $('#detail .price').html(price);
    $('#detail .award-title').html(title);
  
    $('#bottom .buy').click(function(){
        $('#modal').show();
    });
   $('.big .modal-body span').click(function(e){
       e.preventDefault();
       var othspan=document.querySelectorAll('.modal-body span');
       $(othspan).removeClass('check');
       $(this).addClass('check');
   });
   $('.buy-count ul').on('click','li',function(){
	   var mymount =parseInt( $(this).parents('#modal').find('.buy-bottom .myredcard').html());
	   var checkNumb = $(this).parents('.buy-count').prev().find('span.check').length;
       $(this).addClass('check').siblings().removeClass('check');
       $('.buy-count .input-group .form-control').val($(this).html());
       $(this).parents('.buy-count').next().find('.price').html(checkNumb*price*($(this).html()));
       if(checkNumb*price*($(this).html())>mymount){
    	   $('#modal .buy.charge').addClass('disable').html('剩余钻石不足，去充值');
       }else{
    	   $('#modal .buy.charge').removeClass('disable').html('立即购买');
       }
   });
   $('.input-group').on('click','span',function(){
       var li=document.querySelectorAll('.buy-count ul li');
       var n= parseInt($(this).parent().find('input').val());
       var mymount =parseInt( $(this).parents('#modal').find('.buy-bottom .myredcard').html());
       var checkNumber = $(this).parents('.buy-count').prev().find('span.check').length;
       if($(this).html()=="-"){
           n--;
           if(n==0){
               return;
           }
           //console.log("-"+n);
           $(this).next().val(n);
           $(this).parents('.input-group').prev().children().removeClass('check');
           $(this).parents('.input-group').prev().children().each(function(i,dom){
               if($(dom).html()==n){
                   $(dom).addClass('check');
               }
           });
           $(this).parents('.buy-count').next().find('.price').html(price*n*checkNumber);
       }
       if($(this).html()=="+"){
           n++;
          // console.log("+"+n);
           $(this).parents('.input-group').prev().children().removeClass('check');
           $(this).parents('.input-group').prev().children().each(function(i,dom){
               if($(dom).html()==n){
                   $(dom).addClass('check');
               }
           });
           $(this).prev().val(n);
           $(this).parents('.buy-count').next().find('.price').html(price*n*checkNumber);
       }
       if(price*n*checkNumber>mymount){
    	   $('#modal .buy.charge').addClass('disable').html('剩余钻石不足，去充值');
       }else{
    	   $('#modal .buy.charge').removeClass('disable').html('立即购买');
       }

   });

    $('#modal .close').click(function(){
        $('#modal').css('display','none');
    });

//    $('.modal-body .col-xs-10').on('click','ul li',function(){
//        $(this).toggleClass('check');
//        var mymount =parseInt( $(this).parents('#modal').find('.buy-bottom .myredcard').html());
//        var n=$('.modal-body .col-xs-10 ul li.check').length;
//        //console.log(n);
//        var num=$(this).parents('.modal-body').next().find('.input-group input').val();
//        var money = price*n*num;
//        $('#modal .buy-bottom .pay').html(money);
//        console.log(money,mymount);
//        if(money>mymount){
//     	   $('#modal .buy.charge').addClass('disable').html('剩余钻石不足，去充值');
//        }else{
//     	   $('#modal .buy.charge').removeClass('disable').html('立即购买');
//        }
//    })
    $('.number .modal-body').on('click','.col-xs-9 .col-xs-3',function(){
    	if($(this).find('span').hasClass('check')){
    		$(this).find('span').removeClass('check');
    	}else{
    		$(this).find('span').addClass('check');
        	$(this).siblings().find('span').removeClass('check');
    	}
    	var checkNum = $('.number .modal-body .col-xs-9 .col-xs-3 span.check').length;
    	var buycount = $(this).parents('.number').find('.buy-count .input-group .text-center').val();
    	$('.buy-bottom .pay').html(checkNum*buycount*price);
    	console.log(checkNum,buycount,price);
    	var mymountnew = $('.buy-bottom .myredcard').html();
        if(checkNum*buycount*price>mymountnew){
     	   $('#modal .buy.charge').addClass('disable').html('剩余钻石不足，去充值');
        }else{
     	   $('#modal .buy.charge').removeClass('disable').html('立即购买');
        }
    	
    })
    
    
	$.ajax({
		url:path+"manager/getRecentBet",
		data:{uuid:uuid,pageNum:1},
		success:function(data){
			var list = JSON.parse(data);
            console.dir(list.redCard);
            $(".myredcard").html(list.redCard);
            if(list.redCard==0){
            	$('#modal .buy.charge').addClass('disable').html('剩余钻石不足，去充值');
            }
		}
	})

     $('#modal .buy.charge').click(function(){
        //http://localhost/MaJiangManage/manager/betlogLot?type=3&amount=11&serialNum=1861456&uuid=135818&facevalue=100&cardcount=2
    	 var totalbetmount=$(this).parent().prev().find('.price').html();
    	 var myredmount = $(this).parent().prev().find('.myredcard').html();
    	 if($(this).hasClass('disable')){
    		 location.href="charge.jsp";
    	 }else{
    		 if(myredmount == 0 || parseInt(totalbetmount) > parseInt(myredmount)){
      	 	   $('#modal .buy.charge').addClass('disable').html('剩余钻石不足，去充值');
      	 	   alert('剩余钻石不足，请先充值！')
      	 	   return;
      	    }
    		 var checkCanBet=false;
    		 $.ajax({
    			 url:path+"manager/checkCanBet",
    			 data:{uuid:sessionStorage['uuid']},
    			 async: false,
    			 success:function(data){
    				 var obj = JSON.parse(data);
    				 if(obj.res==1){
    					 checkCanBet = true;
    				 }else if(obj.res==0){
    					 checkCanBet = false;
    				 }
    			 }
    		 })
    		 if(checkCanBet){
    		   var type='';
    		   if($(this).parents('#modal>div').hasClass('number')){
    			   $(this).parents('#modal>div.number').find('.modal-body span.check').each(function(i,dom){
    				   type+=$(dom).attr('title')+','
    			   });
    			   if(type.length>0){
    				   type=type.slice(0,type.length-1);
    			   }
    		   }else{
    			   type=$(this).parents('#modal>div').find('.modal-body span.check').attr('title');
    		   }
    	        var amount=$(this).parents('#modal>div').find('.buy-bottom .price').html();
    	        var serialNum=$(this).parents('#modal>div').find('.buy-bottom .red').html();
    	        var uuid=sessionStorage['uuid'];
    	        var cardcount=$(this).parents('#modal>div').find('.buy-count input').val();
    	        var facevalue=$(this).parents('#modal>div').find('.modal-title img').attr('alt');
    	        console.log(type,amount,serialNum,facevalue,cardcount,uuid);
    	        var typearr = type.split(",");
    	        if(typearr.length>1){
    	        	var len = typearr.length;
    	        	var f=facevalue;
    	        	var c=cardcount;
    	        	for(var i=0;i<len-1;i++){
    	        		facevalue += ","+f;
    	        		cardcount += ","+c;
    	        	}
                }
    	        $.ajax({
    	        	url:path+"manager/betlogLot",
    	        	data:{
    	        		type:type,
    	        		amount:amount,
    	        		facevalue:facevalue,
    	        		cardcount:cardcount,
    	        		uuid:sessionStorage['uuid'],
    	        		nickName:sessionStorage['nickname']

    	        	},
    	        	success:function(data){
    	        		var res=JSON.parse(data);
    	        		if(res.result){
    	        			alert("抢购成功！");
    	        		}else{
    	        			alert("抢购失败！");
    	        		}
    	        		location.href="index.jsp";
    	        	}
    	        })
    		 }else{
    			    alert("请绑定邀请码！");
    		        var num =prompt("请输入邀请码：");
    		        if(num!=null&&!isNaN(num)){
    		            $.ajax({
    		            	url:path+"manager/addInviteCode",
    		            	data:{uuid:sessionStorage['uuid'],inviteCode:num},
    		            	success:function(data){
    		            		console.log(data);
    		            		var obj = JSON.parse(data);
    		            		if(obj.status>0){
    		            			alert('绑定邀请码成功！');
    		            		}else{
    		            			alert('绑定邀请码失败！');
    		            		}
    		            	}
    		            })
    		        }
    		 }
    	 }
        
    })
    
    
    
    
    
});