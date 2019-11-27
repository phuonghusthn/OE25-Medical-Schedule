$(document).ready(function() {
  $('#calendar').fullCalendar({
    weekends: false,
    dayClick: function(date, jsEvent, view) {
      $('#calendar').fullCalendar('changeView', 'agendaDay')
      $('#calendar').fullCalendar('gotoDate', date);
    },
    defaultView: 'agendaWeek',
    header: {
      center: 'timelineDay,agendaWeek,month'
    },
  })

  $('#my-next-button').click(function() {
    $('#calendar').fullCalendar('next');
  });

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

jQuery.fn.load = function(callback){ $(window).on("load", callback) };

$.widget.bridge('uibutton', $.ui.button)
