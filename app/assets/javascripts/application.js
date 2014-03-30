//= require jquery
//= require jquery_ujs
//= require fancybox
//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded.min
//= require_tree .

$(document).ready(function() {
  $(".work a").fancybox({
    type: 'image',
    onStart: function(selectedArray, selectedIndex, selectedOptions){
      return {
        href: selectedArray[selectedIndex].attributes['fancybox_href'].value
      }
    }
  });

  if ($('#slideshow').length) {
    $('#slideshow').cycle({
      fx: 'fade',
      timeout: 1000
    });
  }

  var $container = $('#works');
  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector : '.work',
      columnWidth : 340
    });
  });
});
