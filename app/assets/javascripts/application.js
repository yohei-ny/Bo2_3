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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require jquery.jpostal
//= require_tree .
// $(document).on("turbolinks:load", function(){
// $('.jpostal_code').jpostal({
// 		post_code : [
// 		'.jpostal_code'
// 		],
// 		address: {
//      ".jpostal_address": "%3%4%5%6%7"
//     }
//   });
// });

$(document).on("turbolinks:load", function(){
  $("#address_zipcode").jpostal({
    // # 郵便番号の入力欄が１つの場合
    // # 111-1111と1111111のどちらの入力形式でも住所を自動入力してくれる
    postcode : [ "#address_zipcode" ],

    // # 郵便番号の入力欄が3桁-4桁で分かれている場合
    // postcode : [ '#zipcode1', '#zipcode2' ]
    // # 入力項目フォーマット
    // #   %3  都道府県
    // #   %4  市区町村
    // #   %5  町域
    // #   %6  大口事業所の番地
    // #   %7  大口事業所の名称
    address  : {
      "#user_prefecture_code" : "%p",
      // # 都道府県が入力される
      "#address_city"            : "%4%5",
       // # 市区町村と町域が入力される
      "#address_street"          : "%6%7"
      // # 大口事務所の番地と名称が入力される
    }
  });
});



