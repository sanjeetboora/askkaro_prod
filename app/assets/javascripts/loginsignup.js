$(document).ready(function(){
    $("img").height($(".main-box").height());

    $(".to-signin").on("click", function () {
        $(this)
        .addClass("top-active-button")
        .siblings()
        .removeClass("top-active-button");
        $(".form-signup").slideUp(500);
        $(".form-signin").slideDown(500);
    });

    $(".to-signup").on("click", function () {
        $(this)
        .addClass("top-active-button")
        .siblings()
        .removeClass("top-active-button");
        $(".form-signin").slideUp(500);
        $(".form-signup").slideDown(500);
    });

    $(".to-signin-link").on("click", function () {
        $(".to-signin")
        .addClass("top-active-button")
        .siblings()
        .removeClass("top-active-button");
        $(".form-signup").slideUp(200);
        $(".form-signin").slideDown(200);
    });

    $(".to-signup-link").on("click", function () {
        $(".to-signup")
        .addClass("top-active-button")
        .siblings()
        .removeClass("top-active-button");
        $(".form-signin").slideUp(200);
        $(".form-signup").slideDown(200);
    });
});