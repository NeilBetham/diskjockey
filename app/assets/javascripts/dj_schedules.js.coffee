# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:load', ->
  setupCalendar()

$(document).ready ->
  setupCalendar()

setupCalendar = ->
  $('#calendar').fullCalendar
    defaultView: 'agendaWeek'
    droppable: true
    editable: true
    allDaySlot: false
    scrollTime: '00:00:00'
    contentHeight: 1050
    header: false
    slotEventOverlap: false
    drop: (date)->
      originalEventObject = $(this).data('eventObject')
      copiedEventObject = $.extend({}, originalEventObject)
      copiedEventObject.start = date
      $('#calendar').fullCalendar('renderEvent', copiedEventObject, true)

  $('#external-events div.external-event').each ->
    eventObject =
      title: $.trim($(this).text())
      editable: true

    $(this).data('eventObject', eventObject)
    $(this).draggable
      zIndex: 999
      revert: true
      revertDuration: 0
