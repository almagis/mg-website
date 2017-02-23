/* global tinymce */
/* global $*/
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require tinymce-jquery

// Initialiser for tiny MCE rich text editor
tinymce.init({
  selector: '.textarea',
  content_css: "/app/assets/stylesheets/application.css.scss"
});

$(document).ready(function(){
  // Overriding rich text styling for article content
  $('.article-body>p').addClass('article-text');
  $('.article-body>p').css({'color': '#333333','font-family': 'Lora','font-size': '20px','line-width': '28px'});
  $('.article-body>p>a').css({'color': '#4286f4'}).attr("target","_blank");
  
  // This code block formats the date so that the ordinal indicator (i.e. 1st, 2nd) is correct
  if ($('.article-date').length) { // Checks to see if there is a date element on the page
    $('.article-date').each( function(index) { // Cycles through each of the date elements on the page
      if ($.inArray($(':nth-child(1)', this).html(), ['1','21','31']) > -1) {
        $(':nth-child(2)', this).html('st'); // Matches the value of the day of the month (first child) to the correct indicator (second child)
      } else if ($.inArray($(':nth-child(1)', this).html(), ['2','22']) > -1) {
        $(':nth-child(2)', this).html('nd');
      } else if ($.inArray($(':nth-child(1)', this).html(), ['3','23']) > -1) {
        $(':nth-child(2)', this).html('rd');
      } else {
        $(':nth-child(2)', this).html('th'); // Defaults to 'th'
      }
    });
  }
});
