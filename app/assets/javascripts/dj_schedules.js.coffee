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

  $('#duprestofweek-button').on 'click', ->
    dupSundayToRestOfWeek()

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
    timezone: 'local'
    drop: (date)->
      originalEventObject = $(this).data('eventObject')
      copiedEventObject = $.extend({}, originalEventObject)
      copiedEventObject.start = date
      copiedEventObject.end = moment(date).add 'hours', 2
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

dateChanged = ->
  year = $('#dj_schedule_start_date_1i').val()
  month = $('#dj_schedule_start_date_2i').val()
  day = $('#dj_schedule_start_date_3i').val()
  date = moment(year + '-' + month + '-' + day, 'YYYY-MM-DD')
  $('#calendar').fullCalendar 'gotoDate', date

dupSundayToRestOfWeek = ->
  newEvents = []
  events = $('#calendar').fullCalendar 'clientEvents', (event)->
    true if event.start.weekday() is 0

  $('#calendar').fullCalendar 'removeEvents', (event)->
    if event.start.weekday() is 0
      return false
    else
      return true

  for day in [1, 2, 3, 4, 5, 6]
    for event in events
      window.testme = event
      newEvents.push
        start: moment(event.start).add('days', day)
        end: moment(event.end).add('days', day)
        title: event.title

  console.log newEvents

  $('#calendar').fullCalendar 'addEventSource', newEvents
