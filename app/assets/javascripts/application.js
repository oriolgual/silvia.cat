//= require jquery
//= require jquery_ujs
//= require fancybox
//= require_tree .

$(document).ready(function() {
  $("#work a").live('click', function(ev) {
    ev.preventDefault();
    $(this).fancybox().click();
  });

  $('#gallery li a').pjax('#main');

  $('#slideshow').cycle({
    fx: 'fade',
    timeout: 1000
  });
});
