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
    dumpEventsToForm()

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
      dumpEventsToForm()

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
  $('#calendar').fullCalendar 'removeEvents'

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

  $('#calendar').fullCalendar 'addEventSource', newEvents

dumpEventsToForm = ->
  console.log 'Blah'
  events = $('#calendar').fullCalendar 'clientEvents'
  form = $('#new_dj_schedule')
  ul = $('<ul>').attr(
    id: 'dj_slots_from_calendar'
    style: 'display:none;'
  ).appendTo(form)

  $('#new_dj_schedule #dj_slots_from_calendar').remove()
  console.log events
  events.map (event, index, array)->
    li = $('<li>')

    $('<input>').attr(
      type: 'hidden'
      name: 'dj_schedule[dj_slots_attributes][' + index + '][start_time(4i)]'
      value: event.start.hour()
    ).appendTo li

    $('<input>').attr(
      type: 'hidden'
      name: 'dj_schedule[dj_slots_attributes][' + index + '][start_time(5i)]'
      value: event.start.minute()
    ).appendTo li

    $('<input>').attr(
      type: 'hidden'
      name: 'dj_schedule[dj_slots_attributes][' + index + '][stop_time(4i)]'
      value: event.end.hour()
    ).appendTo li

    $('<input>').attr(
      type: 'hidden'
      name: 'dj_schedule[dj_slots_attributes][' + index + '][stop_time(5i)]'
      value: event.end.minute()
    ).appendTo li

    $('<input>').attr(
      type: 'hidden'
      name: 'dj_schedule[dj_slots_attributes][' + index + '][day_of_week]'
      value: event.start.day()
    ).appendTo li

    li.appendTo(ul)
  ul.appendTo(form)
