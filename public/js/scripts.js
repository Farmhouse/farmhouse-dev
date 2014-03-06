/* global responsiveNav:true */

function centerImage(wrapper) {
  var image = wrapper.find('img');
  if (wrapper.height() >= 800) {
    var wrapperHeight = wrapper.height();
    var imageHeight = image.height();
    var overlap = (wrapperHeight - imageHeight) / 2;
    image.css('margin-top', overlap);
  }
  else {
    image.css('margin-top', 0);
  }
}

// debulked onresize handler
function on_resize(c,t){onresize=function(){clearTimeout(t);t=setTimeout(c,100);};return c;}


$(function() {

  // Avoid `console` errors in browsers that lack a console.
  var method;
  var noop = function () {};
  var methods = [
      'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
      'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
      'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
      'timeStamp', 'trace', 'warn'
  ];
  var length = methods.length;
  var console = (window.console = window.console || {});

  while (length--) {
      method = methods[length];

      // Only stub undefined methods.
      if (!console[method]) {
          console[method] = noop;
      }
  }


  // Creates collapsed nav on mobile
  responsiveNav(".nav-collapse", {openPos: "relative"});


  // Center hero image vertically
  // if ($('.center-image').length > 0) {
  //   wrapper = $('.center-image')
  //   centerImage(wrapper);
  //
  //   on_resize(function() {
  //     centerImage(wrapper);
  //   });
  // }

});


