/**
 * Created by Administrator on 2017/8/28 0028.
 */
//       document.addEventListener('webkitvisibilitychange',function(){
//            if(document.webkitVisibilityState=='visible'){
//            	location.reload();
//            }
//        })
//        document.addEventListener('mozvisibilitychange',function(){
//            if(document.mozVisibilityState=='visible'){
//            	location.reload();
//            }
//        })
var lastTime = +new Date;
	setInterval(function() {
	    if(Math.abs(+new Date - lastTime) > 3000) {
	       // alert("从后台切回！");
	    	$().getNowTime();
			$().getMyRedCard();
	    	task1();
	    }
	    lastTime = +new Date;
	}, 1000);

$(function(){
	
	var path=sessionStorage['basePath'];
	$("#indexfoot").load("foot.jsp",function(){
		$('#footer li:nth-child(1)').addClass('active');
	});
	//$().getMyRedCard();
	setTimeout(function(){
		$().getNowTime();
		$().getMyRedCard();
	},2000);
	$('.mycharge .go-charge').click(function(){
		location.href='charge.jsp';
	})
	
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
	
   // console.log("测试测试"+$().getNowTime());
	function interval(){
        clearInterval(timer);
        timer=null;
        var NowTime = new Date();
        var index=$('.award-head .time-read').html();
        var arr=index.split('.');
        var subarr=arr[0].split(':');
        console.log(subarr[0],subarr[1],arr[1]);
        var EndTime=new Date(parseInt(subarr[0]*60*1000)+parseInt(subarr[1]*1000)+parseInt(arr[1]*10)+parseInt(NowTime.getTime()));
        var EndTimeMsg = EndTime.getFullYear() + "年";
        EndTimeMsg = EndTimeMsg + (EndTime.getMonth() + 1) + "月";
        EndTimeMsg = EndTimeMsg + (EndTime.getDate()) + "日";
        EndTimeMsg = EndTimeMsg + (EndTime.getHours()) + "时";
        EndTimeMsg = EndTimeMsg + (EndTime.getMinutes()) + "分";
        EndTimeMsg = EndTimeMsg + (EndTime.getSeconds()) + "秒";
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
                $('.award-head .time-read').html(nM+":"+nS+"."+nSS);
            }
            else {
//                alert("新的一期");
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
                        	if(parseInt(serialnum)<parseInt(newserial)){
	                        	if(getnewnum){
	                        		clearInterval(getnewnum);
	                        		getnewnum=false;
	                        	};
	                        	gettime();
	                        	$().getMyRedCard();
	                        	//$("#loading").hide();
//	                        	$.ajax({
//	                                url:path+"manager/getRecentBet?uuid=135818&pageNum=5",
//	                                data:'',
//	                                success:function(data){
//	                                	var list = JSON.parse(data);
//	                                	for(var i=0,res=false;i<list.betResult.length;i++){
//	                                		var p=list.betResult[i];
//	                                		if(p.serialnum==serialnum&&p.betresult==1){
//	                                			res=res||true;
//	                                		}
//	                                	}
//	                                	if(res){
//	                                		alert("恭喜中奖！");
//	                                	}
//	                                }
//	                        	})
	                            console.log(serialnum,newserial);
                        	}
                    	}
                    })
                }
                var getnewnum=setInterval(getnew,3000);
            }

        }
        var timer=setInterval(GetRTime, 100);
    }
	
	
    function task1(){
    	$('#top').css('left',0);
    	$("#top ul").html(`<li>充值请联系客服，微信：youzhong23game001</li><li>充值请联系客服，微信：youzhong23game001</li><li>充值请联系客服，微信：youzhong23game001</li>`);
    	var n = 0;
        n-=16000;
        $('#top').animate({left:n},300000,'linear',function(){
        	$('#top').css('left',0);
        	$("#top ul").html(`<li>充值请联系客服，微信：youzhong23game001</li><li>充值请联系客服，微信：youzhong23game001</li><li>充值请联系客服，微信：youzhong23game001</li>`);
        	task1();
        });
    }
    task1();

    $('#menu').on('click','.intro',function(){
        location.href='intro.jsp';
    });
    $('#menu').on('click','.order',function(){
        location.href='order.jsp';
    });
    $('.award-body img').click(function(e){
        e.preventDefault();
        var n=$(this).attr('alt');
        var imgSrc=$(this).attr('src');
        var price=$(this).parents('.award-body').find('.award-body-price b').html();
        var awardTitle=$(this).parents('.award-body').find('.award-body-title').html();
        var facevalue=$(this).attr('title');
        sessionStorage['title']=awardTitle;
        sessionStorage['imgsrc']=imgSrc;
        sessionStorage['type']=n;
        sessionStorage['price']=price;
        sessionStorage['facevalue']=facevalue;
        location.href='detail.jsp';
    });
    $('.award-body-price .go-buy').click(function(e){
        e.preventDefault();
        var n=$(this).parents('.award-body').find('img').attr('alt');
        var imgSrc=$(this).parents('.award-body').find('img').attr('src');
        var price=$(this).parents('.award-body').find('.award-body-price b').html();
        var awardTitle=$(this).parents('.award-body').find('.award-body-title').html();
        sessionStorage['title']=awardTitle;
        sessionStorage['imgsrc']=imgSrc;
        sessionStorage['type']=n;
        sessionStorage['price']=price;
        location.href='detail.jsp';
    })
    
    var hash=[];
	var hashWin=[];
    function getBetWinner(){
    	$.ajax({
        	url:path+"manager/getBetWinnerNews",
        	success:function(data){
        		console.log(data);
        		//{"betWinner":[
//        		{"betmount":1080,
//        		"betresult":-1,
//        		"bettype":3,
//        		"cardcount":"1",
//        		"createtime":1504767189749,
//        		"facevalue":"200",
//        		"lotResult":"",
//        		"lotid":0,
//        		"nickName":"????",
//        		"serialnum":1864908,
//        		"uuid":135818}]}
        		var msg=JSON.parse(data).betWinner;
        		var html='';
        		if(msg.length!=0){
        			for(var i=0,html='';i<msg.length;i++){
        				if(hashWin[msg[i].id]==1){
        					continue;
        				}
        				hashWin[msg[i].id]=1;
        				 var p=msg[i];
                         var count = p.cardcount.split(",");
                         var face = p.facevalue.split(",");
                         console.log(count.length);
        				for(var j=0;j<count.length;j++){
        					html+=`<li>恭喜${p.nickName}赢得京东E卡-面值${face[j]}元${count[j]}张</li>`;
        				}
        			}
        			$('#top ul').append(html);
        			$.ajax({
            				url:path+"manager/getBetNews",
            				success:function(data){
            					var msg=JSON.parse(data).betWinner;
            					var html='';
            					if(msg.length!=0){
            						for(var i=0;i<msg.length;i++){
            							if(hash[msg[i].createtime]==1){
            								continue;
            							}
            							hash[msg[i].createtime]=1;
            							 var o=msg[i];
            	                         var count = o.cardcount.split(",");
            	                         var face = o.facevalue.split(",");
            	                         console.log(count.length);
            	        				for(var j=0;j<count.length;j++){
            	        					html+=`<li>${o.nickName}抢购京东E卡-面值${face[j]}元 ${count[j]}张</li>`;
            	        				}
            						}
            						if(html==''){
            							html='<li>充值请联系客服，微信：youzhong23game001</li>';
            						}
            					}else{
            						html='<li>充值请联系客服，微信：youzhong23game001</li>';
            					}
            					$('#top ul').append(html);
            				}
            		})
        		}else{
        			$.ajax({
        				url:path+"manager/getBetNews",
        				success:function(data){
        					var msg=JSON.parse(data).betWinner;
        					if(msg.length!=0){
        						for(var i=0;i<msg.length;i++){
        							if(hash[msg[i].createtime]==1){
        								continue;
        							}
        							hash[msg[i].createtime]=1;
        							 var p=msg[i];
        	                         var count = p.cardcount.split(",");
        	                         var face = p.facevalue.split(",");
        	                         console.log(count.length);
        	        				for(var j=0;j<count.length;j++){
        	        					html+=`<li>${p.nickName}抢购京东E卡-面值${face[j]}元${count[j]}张</li>`;
        	        				}
        						}
        						if(html==''){
        							html='<li>充值请联系客服，微信：youzhong23game001</li>';
        						}
        					}else{
        						html='<li>充值请联系客服，微信：youzhong23game001</li>';
        					}
        					$('#top ul').append(html);
        				}
        			})
        			
        		}
        		
        	}
        })
    }
    var getbetnews=setInterval(getBetWinner,6000);
    
});

