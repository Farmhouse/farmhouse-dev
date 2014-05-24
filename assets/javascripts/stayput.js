(function ($) {

  var methods = {

    init: function() {      
      var $this = $(this);
      var wrapHeight = $this.outerHeight();
      $this.addClass('stay-put').wrap('<div class="stay-put-wrapper"></div>');
      $this.parent().css('height', wrapHeight);

      $(window).smartresize(function() {
        var wrapHeight = $this.outerHeight();
        $this.parent().css('height', wrapHeight);
      });
    },
    reset: function() {
      var $this = $(this);
      $this.removeClass('stay-put').unwrap();
      $this.parent().css('height', 'auto');
    }
  }

  $.fn.stayPut = function (method) {
    return this.each(function() {
      if (method) {
        methods[method].apply(this);
      }
      else if ( !method ) {
        methods.init.apply(this);
      }
      else {
        $.error('Method ' + method + ' does not exist on jQuery.stayPut');
      }
    });

  };

}(jQuery));

// Smart window resize function
// http://www.paulirish.com/2009/throttled-smartresize-jquery-event-handler/
(function($,sr){

  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
      var timeout;

      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null;
          };

          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);

          timeout = setTimeout(delayed, threshold || 100);
      };
  }
  // smartresize
  jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');
