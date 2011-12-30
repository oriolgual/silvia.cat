//= require jquery
//= require jquery_ujs
//= require fancybox
//= require_tree .

var scrollable = null;

$(document).ready(function() {
  $("#gallery").scrollable({vertical: false});
  scrollable = $("#gallery").data('scrollable');

  $("#work a").live('click', function(ev) {
    ev.preventDefault();
    $(this).fancybox().click();
  });

  $('#gallery li a').pjax('#work', {fragment: '.work_wrapper'});

  $('#slideshow').cycle({
    fx: 'fade',
    timeout: 1000
  });
});
