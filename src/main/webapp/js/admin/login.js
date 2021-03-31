$(function(){
    $("#username").on("blur",function () {
        var username=$(this).val();
        if(username.length==0)
        {
            $("#usernameLable").text("*");

        }
        else{
            $("#usernameLable").text("");

        }
    })
    $("#phone").on("blur",function () {
        var phone=$(this).val();
        if(phone.length==0)
        {
            $("#phoneLable").text("*");

        }
        else{
            $("#phoneLable").text("");

        }
    })
    $("#password").on("blur",function () {
        var password=$(this).val();
        if(password.length==0){
            $("#passwordLable").text("*");
        }
        else{
            $("#passwordLable").text("");
        }
    })
    $("form").on("submit",function(){
        var username=$("#username").val();
        if(username.length==0){
            $("#usernameLable").text("*");
            return false;
        }
        else{
            $("#usernameLable").text("");
            return true;
        }
    })
    $("form").on("submit",function(){
        var password=$("#password").val();
        if(password.length==0){
            $("#passwordLable").text("*");
            return false;
        }
        else{
            $("#passwordLable").text("");
            return true;
        }
    })
    $("form").on("submit",function(){
        var phone=$("#phone").val();
        if(phone.length==0){
            $("#phoneLable").text("*");
            return false;
        }
        else{
            $("#phoneLable").text("");
            return true;
        }
    })
})
