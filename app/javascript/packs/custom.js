$(document).ready(function() {
  $('.alert').delay(5000).fadeOut();

  schedule = $('#calendar').data('schedule');

  $('#calendar').fullCalendar({
    weekends: false,

    eventClick: function(calEvent, jsEvent, view) {
      $('#calendar').fullCalendar('changeView', 'agendaDay')
      $('#calendar').fullCalendar('gotoDate', calEvent);
    },

    eventMouseout: function(calEvent, jsEvent) {
      $(this).css('z-index', 8);
      $('.tooltipevent').remove();
    },
    defaultView: 'month',

    header: {
      center: 'timelineDay,agendaWeek,month'
    },

    events: schedule,

    eventMouseover: function(calEvent, jsEvent) {
      var duration = calEvent.start.format("HH:mm") + ' - ' + calEvent.end.format("HH:mm")
      var tooltip = '<div class="tooltipevent" style="width:200px;background:white;border-style:inset;padding: 15px;position:absolute;z-index:10001;">' + duration + '</br>' + calEvent.title + '</div>';
      var $tooltip = $(tooltip).appendTo('body');

      $(this).mouseover(function(e) {
        $(this).css('z-index', 10000);
        $tooltip.fadeIn('500');
        $tooltip.fadeTo('10', 1.9);
      }).mousemove(function(e) {
        $tooltip.css('top', e.pageY + 10);
        $tooltip.css('left', e.pageX + 20);
      });
    },
  });

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
