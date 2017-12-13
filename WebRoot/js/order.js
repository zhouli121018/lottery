/**
 * Created by Administrator on 2017-09-04.
 */
/**
 * Created by Administrator on 2017-08-29.
 */
var path=sessionStorage['basePath'];
$("#orderFoot").load("foot.jsp",function(){
	$("#footer li:nth-child(2)").addClass("active");
})
$(function(){
   $("#order-top .top-item[title='#open']").click(function(){
	    var num=10;
	    function getRecentLotResult(){
	        $.ajax({
	            url:path+"manager/getRecentLotResult?num="+num,
	            data:'',
	            success:function(data){
	                //开奖记录
	                //var arr = eval('(' + data + ')');
	                var arr=JSON.parse(data);
	                var lotResult=arr.lotResult;
//	    	        var lotResult=[{"id":1,"lotid":0,"opentime":1503468326000,"result":"1,3,5,7,9","serialnum":123456},
//	    	                       {"id":2,"lotid":0,"opentime":1503423426000,"result":"2,4,8,6,4","serialnum":234567},
//	    	                       {"id":3,"lotid":0,"opentime":1501468326000,"result":"4,8,5,7,9","serialnum":345678}];
	                console.dir(lotResult);
	                for(var i=0,html='';i<lotResult.length;i++){
	                    var o=lotResult[i];
	                    var sum = parseInt(o.result[0]) + parseInt(o.result[2]) + parseInt(o.result[4]) + parseInt(o.result[6]) + parseInt(o.result[8]);
	                    html +=`<div class="result-item row">
				            <div class="col-xs-9">
				              <div class="body-time">
				                第 <span>${o.serialnum}</span> 期
				              </div>
				              <div class="body-number">
				                <b>${o.result[0]}</b> +
				                <b>${o.result[2]}</b> +
				                <b>${o.result[4]}</b> +
				                <b>${o.result[6]}</b> +
				                <b>${o.result[8]}</b> =
				                <b class="sum">${sum}</b>
				              </div>
				            </div>
				            <div class="col-xs-3">
				              <div class="row">
				                <div class="col-xs-3">
				                  <span class="${sum<=22?'small0':'large'}">${sum<=22?"小":"大"}</span>
				                </div>
				                <div class="col-xs-3 col-xs-offset-1">
				                  <span class="${sum%2==0?'double':'single'}">${sum%2==0?"双":"单"}</span>
				                </div>
				              </div>
				            </div>
				          </div>`;
	                }
	                //console.log(html);
	                $('#open .result-list').html(html);
	                if(lotResult.length<num){
	                    $('#open .hasMore>div').html('——不要拉了 只有这些商品 ——');
	                    $('#open .hasMore').addClass('disable');
	                }
	            }
	        })
	
	    }
	    getRecentLotResult();
	    $('#open .hasMore').click(function(){
	       if($(this).hasClass('disable')){
	           return;
	       }else{
	           num+=10;
	           getRecentLotResult();
	       }
	    });

   })
    //我的投注记录
    var pageNum=10;
   var uuid = sessionStorage['uuid'];
    function getRecentBet(){
        $.ajax({
            url:path+"manager/getRecentBet?uuid="+uuid+"&pageNum="+pageNum,
            data:'',
            success:function(data){
//    	var list={"betResult":[{"betmount":11,"betresult":-1,"bettype":"3","cardcount":"2","createtime":1503634500000,"facevalue":"100","id":6,"lotid":0,"serialnum":1861456,"uuid":135818},
//    	{"betmount":11,"betresult":1,"bettype":"13","cardcount":"2","createtime":1503123800000,"facevalue":"100","id":7,"lotid":0,"serialnum":1861456,"uuid":135818,"lotResult":"1,3,5,8,4"},
//    	{"betmount":11,"betresult":-1,"bettype":"3","cardcount":"2","createtime":1503222800000,"facevalue":"100","id":8,"lotid":0,"serialnum":1861456,"uuid":135818}]};
//               var data='{"betResult":[{"betmount":312,"betresult":-1,"bettype":11,"cardcount":"3","createtime":1510133046000,"facevalue":"100","id":10517,"lotResult":"Jaly","lotid":0,"serialnum":20171108068,"uuid":136972},{"betmount":312,"betresult":-1,"bettype":29,"cardcount":"3","createtime":1510133046000,"facevalue":"100","id":10518,"lotResult":"Jaly","lotid":0,"serialnum":20171108068,"uuid":136972},{"betmount":312,"betresult":-1,"bettype":59,"cardcount":"3","createtime":1510133046000,"facevalue":"100","id":10519,"lotResult":"Jaly","lotid":0,"serialnum":20171108068,"uuid":136972},{"betmount":440,"betresult":-1,"bettype":3,"cardcount":"1,3","createtime":1510133433000,"facevalue":"20,20","id":10520,"lotResult":"Jaly","lotid":0,"serialnum":20171108068,"uuid":136972},{"betmount":110,"betresult":1,"bettype":3,"cardcount":"1","createtime":1510131483000,"facevalue":"20","id":10515,"lotResult":"8,5,0,2,3","lotid":0,"serialnum":20171108065,"uuid":136972},{"betmount":1100,"betresult":1,"bettype":2,"cardcount":"1","createtime":1510131520000,"facevalue":"200","id":10516,"lotResult":"8,5,0,2,3","lotid":0,"serialnum":20171108065,"uuid":136972},{"betmount":550,"betresult":-1,"bettype":3,"cardcount":"1","createtime":1510130476000,"facevalue":"100","id":10508,"lotResult":"Jaly","lotid":0,"serialnum":20171108064,"uuid":136972},{"betmount":1100,"betresult":1,"bettype":5,"cardcount":"1","createtime":1510130517000,"facevalue":"200","id":10509,"lotResult":"3,9,4,3,3","lotid":0,"serialnum":20171108064,"uuid":136972},{"betmount":104,"betresult":-1,"bettype":11,"cardcount":"1","createtime":1510130601000,"facevalue":"100","id":10510,"lotResult":"Jaly","lotid":0,"serialnum":20171108064,"uuid":136972},{"betmount":104,"betresult":-1,"bettype":23,"cardcount":"1","createtime":1510130601000,"facevalue":"100","id":10511,"lotResult":"Jaly","lotid":0,"serialnum":20171108064,"uuid":136972}],"redCard":8088}'
    			
    			var list = JSON.parse(data);
                console.dir(list.betResult);
                if(list.betResult.length<pageNum){
                    $('#record p.hasMore').html('——不要拉了 只有这些商品 ——');
                    $('#record p.hasMore').addClass('disable');
                }
                for(var k=0;k<list.betResult.length-1;k++){
					for(var l=k+1;l<list.betResult.length;l++){
					 
						   if(list.betResult[k].cardcount==list.betResult[l].cardcount&&list.betResult[k].facevalue==list.betResult[l].facevalue&&list.betResult[k].serialnum==list.betResult[l].serialnum&& (Math.abs(list.betResult[l].createtime-list.betResult[k].createtime)<=1000)){
								list.betResult[k].bettype+=','+list.betResult[l].bettype;
								list.betResult.splice(l,1);
								l--;
							}
					}
				}
                console.log('这是分割线');
                console.dir(list.betResult);
                for(var i=0,lothtml = '';i<list.betResult.length;i++){
                    var p=list.betResult[i];
                    var count = p.cardcount.split(",");
                    var face = p.facevalue.split(",");
                    //console.log(count.length);
                    for(var m=0;m<face.length-1;m++){
						console.log("m:"+m);
						for(var n=m+1;n<face.length;n++){
							if(face[m]==face[n]){
								count[m]=parseInt(count[m])+parseInt(count[n]);
								count.splice(n,1);
								face.splice(n,1);
								console.log("n:"+n);
								n--;

							}

						}
					}
                    console.dir(list.betResult);
                    for(var j=0;j<count.length;j++){
                    	var src='images/08181843255996c4cd92656.jpg';
                    	var mountprice=0;
                    	console.log("bettype:"+p.bettype);
                    	if(p.bettype<10){
                    		if(face[j]==20){
                            	  src= 'images/20.png';
                            	  mountprice=104;
                            	}else if(face[j]==100){
                            		src='images/100.png';
                            		mountprice=520;
                            	}else if(face[j]==200){
                            		src='images/200.png';
                            		mountprice=1040;
                            	}else if(face[j]==500){
                            		src='images/500.png';
                            		mountprice=2600;
                            	}else if(face[j]==1000){
                            		src='images/1000.png';
                            		mountprice=5200;
                            	}
                    	}else{
                    		src= 'images/s20.png';
                      	    mountprice=104;
                    	}
                    	var bettypes='';
                    	 if(p.betresult==-1){
                    		if(p.bettype<10){
                    			 bettypes=` <div class="buy">
                    			 <span class="${p.bettype==3?'check':''}">小</span>
 				                 <span class="${p.bettype==2?'check':''}">大</span>
 				                 <span class="${p.bettype==5?'check':''}">单</span>
 				                 <span class="${p.bettype==7?'check':''}">双</span>
 				                 </div>`;
                    		 }else{
                    			 bettypes=`
                    			 <div class="buy first-number">1:
                                     <span class="${String(p.bettype).indexOf('13')!=-1?'check':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('11')!=-1?'check':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('17')!=-1?'check':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('19')!=-1?'check':''}">双</span>
                                 </div>
                                 <div class="buy second-number">2:
                                     <span class="${String(p.bettype).indexOf('29')!=-1?'check':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('23')!=-1?'check':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('31')!=-1?'check':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('37')!=-1?'check':''}">双</span>
                                 </div>
                                 <div class="buy third-number">3:
                                     <span class="${String(p.bettype).indexOf('43')!=-1?'check':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('41')!=-1?'check':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('47')!=-1?'check':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('53')!=-1?'check':''}">双</span>
                                 </div>
                                 <div class="buy fourth-number">4:
                                     <span class="${String(p.bettype).indexOf('61')!=-1?'check':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('59')!=-1?'check':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('67')!=-1?'check':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('71')!=-1?'check':''}">双</span>
                                 </div>
                                 <div class="buy fifth-number">5:
                                     <span class="${String(p.bettype).indexOf('79')!=-1?'check':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('73')!=-1?'check':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('83')!=-1?'check':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('89')!=-1?'check':''}">双</span>
                                 </div>
                           `;
                    		 }
                         	lothtml+=`<div class="list">
     				           <div class="row">
     				             <div class="col-xs-6">订单编号：<span>${parseInt(p.id)+1000000}</span></div>
     				             <div class="col-xs-6 text-right">${new Date(p.createtime).Format("yyyy-MM-dd HH:mm:ss")}</div>
     				           </div>
     				           <div class="row list-mid">
     				             <div class="col-xs-5">
     				               <img src="${src}" class="img-responsive" alt="0"/>
     				               <p>面值${face[j]}</p>
     				             </div>
     				             <div class="col-xs-7">
     				               <p>购买数字：</p>
     				               
     				                 ${bettypes}
     				               
     				               <div class="red">
     				                 未开奖
     				               </div>
     				               <div>
     				                 <span>购买份数：<b>${count[j]}</b></span>&nbsp;&nbsp;
     				                 <span>消耗钻石：<b>${count[j]*mountprice}</b></span>
     				               </div>
     				             </div>
     				           </div>
     				           <div class="row">
     					           <div class="col-xs-4">
     				               <p>开奖期号:<span>${p.serialnum}</span></p>
     				             </div>
     				             <div class="col-xs-5">
     				             </div>
     				             <div class="col-xs-3 buy-again">
     				               <a href="index.jsp">再次购买</a>
     				             </div>
     				           </div>
     				         </div>`;
                         }else{
                        	 var sum = parseInt(p.lotResult[0])+parseInt(p.lotResult[2])+parseInt(p.lotResult[4])+parseInt(p.lotResult[6])+parseInt(p.lotResult[8]);
                        	 if(p.bettype<10){
                    			 bettypes=` <div class="buy">
                    			     <span class="${p.bettype==3?'check':''} ${sum<=22?'success':''}">小</span>
					                 <span class="${p.bettype==2?'check':''} ${sum>22?'success':''}">大</span>
						             <span class="${p.bettype==5?'check':''} ${sum%2==1?'success':''}">单</span>
						             <span class="${p.bettype==7?'check':''} ${sum%2==0?'success':''}">双</span>
						             </div>`;
                    		 }else{
                    			 bettypes=`
                    			 <div class="buy first-number">1:
                                     <span class="${String(p.bettype).indexOf('13')!=-1?'check':''} ${p.lotResult[0]<=4?'success':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('11')!=-1?'check':''} ${p.lotResult[0]>4?'success':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('17')!=-1?'check':''} ${p.lotResult[0]%2==1?'success':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('19')!=-1?'check':''} ${p.lotResult[0]%2==0?'success':''}">双</span>
                                 </div>
                                 <div class="buy second-number">2:
                                     <span class="${String(p.bettype).indexOf('29')!=-1?'check':''} ${p.lotResult[2]<=4?'success':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('23')!=-1?'check':''} ${p.lotResult[2]>4?'success':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('31')!=-1?'check':''} ${p.lotResult[2]%2==1?'success':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('37')!=-1?'check':''} ${p.lotResult[2]%2==0?'success':''}">双</span>
                                 </div>
                                 <div class="buy third-number">3:
                                     <span class="${String(p.bettype).indexOf('43')!=-1?'check':''} ${p.lotResult[4]<=4?'success':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('41')!=-1?'check':''} ${p.lotResult[4]>4?'success':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('47')!=-1?'check':''} ${p.lotResult[4]%2==1?'success':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('53')!=-1?'check':''} ${p.lotResult[4]%2==0?'success':''}">双</span>
                                 </div>
                                 <div class="buy fourth-number">4:
                                     <span class="${String(p.bettype).indexOf('61')!=-1?'check':''} ${p.lotResult[6]<=4?'success':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('59')!=-1?'check':''} ${p.lotResult[6]>4?'success':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('67')!=-1?'check':''} ${p.lotResult[6]%2==1?'success':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('71')!=-1?'check':''} ${p.lotResult[6]%2==0?'success':''}">双</span>
                                 </div>
                                 <div class="buy fifth-number">5:
                                     <span class="${String(p.bettype).indexOf('79')!=-1?'check':''} ${p.lotResult[8]<=4?'success':''}">小</span>
                                     <span class="${String(p.bettype).indexOf('73')!=-1?'check':''} ${p.lotResult[8]>4?'success':''}">大</span>
                                     <span class="${String(p.bettype).indexOf('83')!=-1?'check':''} ${p.lotResult[8]%2==1?'success':''}">单</span>
                                     <span class="${String(p.bettype).indexOf('89')!=-1?'check':''} ${p.lotResult[8]%2==0?'success':''}">双</span>
                                 </div> `;
                    		 }
                         	
     	                    lothtml+=`<div class="list">
     						           <div class="row">
     						             <div class="col-xs-6">订单编号：<span>${parseInt(p.id)+1000000}</span></div>
     						             <div class="col-xs-6 text-right">${new Date(p.createtime).Format("yyyy-MM-dd HH:mm:ss")}</div>
     						           </div>
     	
     						           <div class="row list-mid">
     						             <div class="col-xs-5">
     						               <img src="${src}" class="img-responsive" alt="0"/>
     						               <p>面值${face[j]}</p>
     						             </div>
     						             <div class="col-xs-7">
     						               <p>购买数字：</p>
     						                 ${bettypes}
     						               <div class="red">
     						                 获胜号码：${p.lotResult[0]}+${p.lotResult[2]}+${p.lotResult[4]}+${p.lotResult[6]}+${p.lotResult[8]}=${sum}(${sum<=22?"小":"大"}${sum%2==0?"双":"单"})
     						               </div>
     						               <div>
     						                 <span>购买份数：<b>${count[j]}</b></span>&nbsp;&nbsp;
     						                 <span>消耗钻石：<b>${count[j]*mountprice}</b></span>
     						               </div>
     						             </div>
     						           </div>
     						           <div class="row">
     						             <div class="col-xs-4">
     						               <p>开奖期号:<span>${p.serialnum}</span></p>
     						             </div>
     						             <div class="col-xs-5">
     						               ${p.betresult==1?"恭喜获胜 <a href='exchange.jsp' class='btn success btn-sm'>领取奖品</a>":"再接再厉"}
     	
     						             </div>
     						             <div class="col-xs-3 buy-again">
     						               <a href="index.jsp">再次购买</a>
     						             </div>
     						           </div>
     						         </div>`;
     					  }
                    }
                   
                }

                $('#record .record-item').html(lothtml);
                $('.list').each(function(i,dom){
                	var num=$(dom).find('.list-mid .buy .check').length;
                	var beforePrice=$(dom).find('.list-mid .col-xs-7 div:last-child span:last-child b').html();
                    $(dom).find('.list-mid .col-xs-7 div:last-child span:last-child b').html(beforePrice*num);
                    if($(dom).find('.list-mid .buy .check.success').length>0){
                    	$(dom).children('div.row:last-child').find('.col-xs-5').html("恭喜获胜 <a href='exchange.jsp' class='btn success btn-sm'>领取奖品</a>");
                    }
                })
               
            }
        })
    }
    getRecentBet();
    $('#record p.hasMore').click(function(){
        if($(this).hasClass('disable')){
            return;
        }else{
            pageNum+=10;
            getRecentBet();
        }
    })


});

$('#order-top').on('click','div.top-item',function(e){
    e.preventDefault();
    $(this).addClass('active').siblings().removeClass('active');
    var id=$(this).attr('title');
    $(id).css('display','block').siblings().css('display','none');

});




