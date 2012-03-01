# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("a#personal-data").click ->
    $(".form.user").show()
    $("div#authorizations").hide()
    $("div#preferences").hide()
  $("a#authorizations").click ->
    $(".form.user").hide()
    $("div#authorizations").show()
    $("div#preferences").hide()
  $("a#preferences").click ->
    $(".form.user").hide()
    $("div#authorizations").hide()
    $("div#preferences").show()
