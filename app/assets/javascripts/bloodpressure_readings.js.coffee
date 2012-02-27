# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#bp-chart").hide()
  $("#show-chart").click ->
    $("#bp-table").fadeToggle()
    $("#bp-chart").fadeToggle()
    label = if $(this).html() == '<i class="icon-signal"></i> Show Chart' then '<i class="icon-th-list"></i> Show Table' else '<i class="icon-signal"></i> Show Chart'
    $(this).html(label)