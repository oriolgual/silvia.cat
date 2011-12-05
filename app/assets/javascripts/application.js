//= require jquery
//= require jquery_ujs
//= require fancybox
//= require_tree .
$(document).ready(function() {
  $("#work a").fancybox();
});

$('#slideshow').cycle({
  fx: 'fade',
  timeout: 1000
});
