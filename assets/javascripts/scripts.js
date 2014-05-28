/* global responsiveNav:true */

// debulked onresize handler
function on_resize(c,t){onresize=function(){clearTimeout(t);t=setTimeout(c,100);};return c;}


$(function() {

  // Creates collapsed nav on mobile
  responsiveNav(".nav-collapse", { openPos: "relative" });

  if (Modernizr.input.placeholder) {
    $('html').addClass('placeholder');
  } else {
    $('html').addClass('no-placeholder');
  }

});
