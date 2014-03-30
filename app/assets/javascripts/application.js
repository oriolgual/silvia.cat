//= require jquery
//= require jquery_ujs
//= require fancybox
//= require masonry/jquery.masonry
//= require masonry/jquery.imagesloaded.min
//= require_tree .

function titleFormat(title_text, selectedArray, selectedIndex, currentOpts) {
  var href = selectedArray[selectedIndex].attributes['href'].value;
  var social_text = title_text + ' by Silvia Brujas';

  var title = '<div id="fancybox-title"><span class="title">'+ title_text +'</span></div>';
  title += '<div class="share">';
  title += '<a class="twitter-share-button" data-count="none" data-text="' + social_text + '" data-url="' + href + '" data-related="silviabrujas" data-via="silviabrujas" href="https://twitter.com/share">Tweet</a>';
  title += '<div class="google-plus"><div class="g-plusone" data-annotation="none" data-size="tall" data-href="'+href+'"></div></div>';
  title += '<div class="fb-share-button" data-href="' + href +'" data-type="button"></div>'
  title += '<iframe src="//www.facebook.com/plugins/like.php?href=' + href + '&amp;layout=button_count&amp;show_faces=true&amp;width=500&amp;action=like&amp;font&amp;colorscheme=light&amp;height=23" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:110px; height:23px;" allowTransparency="true"></iframe>';
  title += '</div>';

  return title;
}

$(document).ready(function() {
  $(".work a").fancybox({
    type: 'image',
    titlePosition: 'inside',
    titleFormat: titleFormat,
    onStart: function(selectedArray, selectedIndex, selectedOptions){
      return {
        href: selectedArray[selectedIndex].attributes['fancybox_href'].value
      }
    },
    onComplete: function(selectedArray, selectedIndex, selectedOptions){
      if (twttr != undefined) twttr.widgets.load();
      if (gapi != undefined) gapi.plusone.go();
      if (FB != undefined) FB.XFBML.parse();
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
