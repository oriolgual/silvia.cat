//= require jquery
//= require jquery_ujs
//= require fancybox
//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded.min
//= require_tree .

$(document).ready(function() {
  $(".work a").live('click', function(ev) {
    ev.preventDefault();
    $(this).fancybox().click();
  });

  $('#sidebar li a').pjax('#content');

  $('#slideshow').cycle({
    fx: 'fade',
    timeout: 1000
  });

  var $container = $('#works');
  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector : '.work',
      columnWidth : 340
    });
  });
});
