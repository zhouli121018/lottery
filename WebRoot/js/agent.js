$("#agentfoot").load("foot.jsp",function(){
	$("#footer").css('background',"#fff");
})
$('.agent-mid button').click(function(){
	location.href='childAgent.jsp';
})
var path = sessionStorage['basePath'];
$('#tixian').click(function(){
	$.ajax({
		   url: path+"manager/tixian",
		   data: "",
		   success: function data(data){
			   var returns =  eval('(' + data + ')');
			   if(typeof(returns.total)!="undefined"){ 
				   alert(returns.info);
				   }else{
					   alert(returns.error);
				   } 
			}
		});
	$(this).prop('disabled',true);
	var sel=this;
	var timer=setTimeout(function(){
		$(sel).prop('disabled',false);
	},3000)
})
