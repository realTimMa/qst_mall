$(function(){
	$("#realName").on("blur",function () {
		var realName=$(this).val();
		if(realName.length==0)
		{
			$("#realNameLable").text("*");

		}
		else{
			$("#realNameLable").text("");

		}
	})
	$("#address").on("blur",function () {
		var address=$(this).val();
		if(address.length==0)
		{
			$("#addressLable").text("*");

		}
		else{
			$("#addressLable").text("");

		}
	})
	$("#password").on("blur",function () {
		var password=$(this).val();
		if(password.length==0){
			$("#passwordLable").text("*");
		}
		else if (!(/\d/.test(password)&&/[a-z]/i.test(password)||
			/\d/.test(password)&&/[\@\#\$\%\&\*]/.test(password)||
			/[\@\#\$\%\&\*]/.test(password)&&/[a-z]/i.test(password))) {

			$("#passwordLable").text("密码格式不正确");
			return false;
		}
		else{
			$("#passwordLable").text("");
		}
	})
	$("#password1").on("blur",function () {
		var password1=$(this).val();
		if(password1.length==0){
			$("#password1Lable").text("*");
		}
		else if (!(/\d/.test(password1)&&/[a-z]/i.test(password1)||
			/\d/.test(password1)&&/[\@\#\$\%\&\*]/.test(password1)||
			/[\@\#\$\%\&\*]/.test(password1)&&/[a-z]/i.test(password1))) {

			$("#password1Lable").text("密码格式不正确");
			return false;
		}
		else{
			$("#password1Lable").text("");
		}
	})

	$("form").on("submit",function(){
		var realName=$("#realName").val();
		if(realName.length==0){
			$("#realNameLable").text("*");
			return false;
		}
		else{
			$("#realNameLable").text("");
			return true;
		}
	})
	$("form").on("submit",function(){
		var address=$("#address").val();
		if(address.length==0){
			$("#addressLable").text("*");
			return false;
		}
		else{
			$("#addressLable").text("");
			return true;
		}
	})
	$("form").on("submit",function(){
		var password=$("#password").val();
		if(password.length==0){
			$("#passwordLable").text("*");
			return false;
		}
		else if (!(/\d/.test(password)&&/[a-z]/i.test(password)||
			/\d/.test(password)&&/[\@\#\$\%\&\*]/.test(password)||
			/[\@\#\$\%\&\*]/.test(password)&&/[a-z]/i.test(password))) {

			$("#passwordLable").text("密码格式不正确");
			return false;
		}
		else{
			$("#passwordLable").text("");
			return true;
		}
	})
	$("form").on("submit",function(){
		var password=$("#password").val();
		var password1=$("#password1").val();
		if(password1.length==0){
			$("#password1Lable").text("*");
			return false;
		}
		else if (!(/\d/.test(password)&&/[a-z]/i.test(password)||
			/\d/.test(password)&&/[\@\#\$\%\&\*]/.test(password)||
			/[\@\#\$\%\&\*]/.test(password)&&/[a-z]/i.test(password))) {

			$("#password1Lable").text("密码格式不正确");
			return false;
		}
		else if(password!=password1)
		{
			$("#password1Lable").text("新密码和确认密码不一致！");
			return false;
		}
		else{
			$("#password1Lable").text("");
			return true;
		}
	})
	$("#phone").on("blur",function(){
		var phone = $("#phone").val();
		var myreg=/^[1][3,4,5,6,7,8,9][0-9]{9}$/;
		if(phone.length==0){
			$("#phoneLable").text("*");
			return false;
		}
		else if (!myreg.test(phone)) {
			$("#phoneLable").text("联系电话格式不正确");
			return false;
		}
		else{
			$("#phoneLable").text("");
			return true;
		}
	})
	$("form").on("submit",function(){
		var phone = $("#phone").val();
		var myreg=/^[1][3,4,5,6,7,8,9][0-9]{9}$/;
		if(phone.length==0){
			$("#phoneLable").text("*");
			return false;
		}
		else if (!myreg.test(phone)) {
			$("#phoneLable").text("联系电话格式不正确");
			return false;
		}
		else{
			$("#phoneLable").text("");
			return true;
		}
	})

	})
