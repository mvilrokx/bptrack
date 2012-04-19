# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#bp-chart").hide()
  $("#show-chart").click ->
    $("#bp-table").fadeToggle()
    $("#bp-chart").fadeToggle()
    label = if $(this).html() == '<i class="icon-signal icon-white"></i> Show Graph' then '<i class="icon-th-list icon-white"></i> Show Table' else '<i class="icon-signal icon-white"></i> Show Graph'
    $(this).html(label)

  $(".jquery-ui-date").datepicker(
    altField: "#recorded-at-alt",
    altFormat: "yy-mm-d"
  )

  unless $.browser.mobile
    $('.btn[data-remote], a[data-remote]').bind('ajax:success', (evt, data, status, xhr) -> 
      $('.modal-body').append(xhr.responseText)
      $('.modal-header h3').text($('.modal-body').find('legend').text())
      $('.modal-body').find('legend').remove()
      $('#modal-form').modal('show')
    )
  else
    # remove remote calls
    $('.btn[data-remote], a[data-remote]').removeAttr("data-remote")
    # make forms (twitter bootstrap) vertical
    $('form.form-horizontal').removeClass("form-horizontal")

