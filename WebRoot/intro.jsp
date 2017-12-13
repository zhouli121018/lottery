<%@ page language="java" import="java.util.*,com.weipai.model.Manager" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String  url  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1);  	   
	if(request.getQueryString()!=null) 
			{   
			    url+="?"+request.getQueryString();           
			}
%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="x-ua-compatible" content="IE=edge">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/index.css"/>
  <title>挖乐28</title>
</head>
<body>
<!--指定容器-->
<div class="container-fluid">
  <img src="images/intro.jpg" class="img-responsive" alt="intro"/>
  <p class="hasMore">—— 不要拉了 只有这些商品 ——</p>
</div>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
var hexcase = 0; /* hex output format. 0 - lowercase; 1 - uppercase */
var chrsz = 8; /* bits per input character. 8 - ASCII; 16 - Unicode */
function hex_sha1(s) {
    return binb2hex(core_sha1(AlignSHA1(s)));
}
function sha1_vm_test() {
    return hex_sha1("abc") == "a9993e364706816aba3e25717850c26c9cd0d89d";
}
function core_sha1(blockArray) {
    var x = blockArray; // append padding
    var w = Array(80);
    var a = 1732584193;
    var b = -271733879;
    var c = -1732584194;
    var d = 271733878;
    var e = -1009589776;
    for (var i = 0; i < x.length; i += 16) // 每次处理512位 16*32
    {var olda = a;
        var oldb = b;
        var oldc = c;
        var oldd = d;
        var olde = e;
        for (var j = 0; j < 80; j++) // 对每个512位进行80步操作
        {
            if (j < 16)
                w[j] = x[i + j];
            else
                w[j] = rol(w[j - 3] ^ w[j - 8] ^ w[j - 14] ^ w[j - 16], 1);
            var t = safe_add(safe_add(rol(a, 5), sha1_ft(j, b, c, d)), safe_add(safe_add(e, w[j]), sha1_kt(j)));
            e = d;
            d = c;
            c = rol(b, 30);
            b = a;
            a = t;
        }
        a = safe_add(a, olda);
        b = safe_add(b, oldb);
        c = safe_add(c, oldc);
        d = safe_add(d, oldd);
        e = safe_add(e, olde);
    }
    return new Array(a, b, c, d, e);
}
function sha1_ft(t, b, c, d) {
    if (t < 20)
        return (b & c) | ((~b) & d);
    if (t < 40)
        return b ^ c ^ d;
    if (t < 60)
        return (b & c) | (b & d) | (c & d);
    return b ^ c ^ d; // t<80
}
function sha1_kt(t) {
    return (t < 20) ? 1518500249 : (t < 40) ? 1859775393 : (t < 60) ? -1894007588 : -899497514;
}
function safe_add(x, y) {
    var lsw = (x & 0xFFFF) + (y & 0xFFFF);
    var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
    return (msw << 16) | (lsw & 0xFFFF);
}
function rol(num, cnt) {
    return (num << cnt) | (num >>> (32 - cnt));
}
function AlignSHA1(str) {
    var nblk = ((str.length + 8) >> 6) + 1,
            blks = new Array(nblk * 16);
    for (var i = 0; i < nblk * 16; i++)
        blks[i] = 0;
    for (i = 0; i < str.length; i++)
        blks[i >> 2] |= str.charCodeAt(i) << (24 - (i & 3) * 8);
    blks[i >> 2] |= 0x80 << (24 - (i & 3) * 8);
    blks[nblk * 16 - 1] = str.length * 8;
    return blks;
}
function binb2hex(binarray) {
    var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
    var str = "";
    for (var i = 0; i < binarray.length * 4; i++) {
        str += hex_tab.charAt((binarray[i >> 2] >> ((3 - i % 4) * 8 + 4)) & 0xF) +
        hex_tab.charAt((binarray[i >> 2] >> ((3 - i % 4) * 8)) & 0xF);
    }
    return str;
}
           var jsapi_ticket=sessionStorage['jsapi_ticket'];
  		   var url="<%=url%>";
  		   var string1 = "jsapi_ticket="+jsapi_ticket+"&noncestr=Wm3WZYTPz0wzccnW&timestamp=1414587457&url="+url;
  		   var signature=hex_sha1(string1);
  
  wx.config({
      debug: false,// 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。移动端会通过弹窗来提示相关信息。如果分享信息配置不正确的话，可以开了看对应报错信息
      appId: "wx6f1a7fce9cf8",
      timestamp:1414587457 ,
      nonceStr: "Wm3WZYTPz0wzccnW",
      signature: signature,
      jsApiList: [//需要使用的JS接口列表,分享默认这几个，如果有其他的功能比如图片上传之类的，需要添加对应api进来
          'checkJsApi',
          'onMenuShareTimeline',//
          'onMenuShareAppMessage',
          'onMenuShareQQ',
          'onMenuShareWeibo'
      ]
  });
      window.share_config = {
  	     "share": {
  	        "imgUrl": "images/wale.jpg",//分享图，默认当相对路径处理，所以使用绝对路径的的话，“http://”协议前缀必须在。
  	        "desc" : "半价商城任你抢购，大小单双抢到就是赚到",//摘要,如果分享到朋友圈的话，不显示摘要。
  	        "title" : "挖乐28",//分享卡片标题
  	        "link": "http://www.wale28.com/lot/wxLogin.jsp?managerId="+sessionStorage['managerId'],//分享出去后的链接，这里可以将链接设置为另一个页面。
  	        "success":function(){//分享成功后的回调函数
  	        	console.log('分享成功！');
  	        },
  	        'cancel': function () { 
  	            // 用户取消分享后执行的回调函数
  	        	console.log('取消分享！');
  	        }
  	    }
  	};  
  	wx.ready(function () {
  	    wx.onMenuShareAppMessage(share_config.share);//分享给好友
  	    wx.onMenuShareTimeline(share_config.share);//分享到朋友圈
  	    wx.onMenuShareQQ(share_config.share);//分享给手机QQ
  	});
</script>
</body>
</html>