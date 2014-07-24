# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:load', ->
  bindEvents()
  setupCalendar()

$(document).ready ->
  bindEvents()
  setupCalendar()

bindEvents = ->
  $('#dj_schedule_start_date_1i').on 'change', ->
    dateChanged()

  $('#dj_schedule_start_date_2i').on 'change', ->
    dateChanged()

  $('#dj_schedule_start_date_3i').on 'change', ->
    dateChanged()

dateChanged = ->
  year = $('#dj_schedule_start_date_1i').val()
  month = $('#dj_schedule_start_date_2i').val()
  day = $('#dj_schedule_start_date_3i').val()
  date = moment(year + '-' + month + '-' + day, 'YYYY-MM-DD')
  $('#calendar').fullCalendar 'gotoDate', date


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
