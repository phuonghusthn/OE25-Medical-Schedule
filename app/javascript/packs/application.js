require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
jQuery.fn.load = function(callback){ $(window).on("load", callback) };

require("bootstrap")
require("js/owl.carousel")
require("js/waypoint")
require("js/counterup")
require("js/jquery.slicknav.min")
require("js/jquery.nice-select.min")
require("js/active")

$(document).ready(function() {
  $(".owl-carousel").owlCarousel({
    nav: true,
		items: 1,
		loop: true,
		center: true,
		margin: 0,
		lazyLoad:true,
		dots: false
  });

  document.addEventListener("turbolinks:before-cache", function() {
    $('.owl-carousel').owlCarousel('destroy');
  });
});
