// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require jquery.jpostal
//= require_tree .


$(function() {
  $('#slider').slick({
      infinite: true, //スライドのループ有効化
      dots: true,
      autoplay: true,
      autoplaySpeed: 4000,
      slidesToShow: 1, //表示するスライドの数
      slidesToScroll: 1, //スクロールで切り替わるスライドの数
      infinite: true, //スライドのループ有効化
      centerMode: true, //要素を中央寄せ
      centerPadding:'10%', //両サイドの見えている部分のサイズ
      
  });
});

$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});
