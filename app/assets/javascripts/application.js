// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    var $tweet_input = $('#write_twit');
    var $tweet_count_label = $('#write_twit_count');
    $tweet_input.focusin(function(){
        $(this).attr("rows", "3")
    });
    $tweet_input.keyup(function() {
        var $rest = 160 - ($(this).val()).toString().length;
        if($rest <= 10){
            $tweet_count_label.css('color','red')
        }
        else{
            $tweet_count_label.css('color',$tweet_input.css('color'));
        }
        $tweet_count_label.html($rest);
    });
});


