$(document).ready(function() {
  $(".owl-carousel").owlCarousel({
		items: 1,
		loop: false,
		center: true,
		margin: 0
  });

  document.addEventListener("turbolinks:before-cache", function() {
    $('.owl-carousel').owlCarousel('destroy');
  });
});
