/**
 * Created by Administrator on 2017-09-01.
 */
$(function(){
    if(sessionStorage['orderList']){
        var str=sessionStorage['orderList'];
        var orderList=JSON.parse(str);
        console.dir(orderList);
        for(var i=0,html='',money=0;i<orderList.length;i++){
            var o=orderList[i];
            money+=o.cardcount*o.facevalue;
            html+=`<div class="sure-sell-item">
            <div class="row">
              <div class="col-xs-6">订单编号：<span>${o.orderNumber}</span></div>
              <div class="col-xs-6 text-right"><span class="glyphicon glyphicon-menu-down"></span></div>
            </div>
            <div class="row title-mid">
              <div class="col-xs-4">
                <img src="${o.imgsrc}" class="img-responsive" alt="1"/>
              </div>
              <div class="col-xs-6">
                <p class="title">${o.title}</p>
                <p>商品编号：<span>${o.bettype}</span></p>
              </div>
              <div class="col-xs-2">X<span>${o.cardcount}</span></div>
            </div></div>`;
        }
        $('.sure-sell-list').html(html);
        $('.sure-info .total span').html("￥"+money);
        $('.sure-bottom h3').html('￥'+parseInt(money*0.99));
        $('.sure-bottom a').click(function(e){
            e.preventDefault();
            sessionStorage.removeItem('orderList');
            sessionStorage['money']=parseInt(money*0.99);
            $.ajax({

            });
            location.href='done.jsp';
        })
    }else{
        location.href='exchange.jsp';
    }
});

