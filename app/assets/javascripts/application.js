//= require jquery
//= require jquery_ujs
//= require fancybox
//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded.min
//= require_tree .

$(document).ready(function() {
  $(".work a").fancybox();

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
