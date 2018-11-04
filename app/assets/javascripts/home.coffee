# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', () ->
  p = /[()\s-]/g
  $('#form-busca-contato').submit(() ->
    $('#campo-numero-telefone-celular').val(
      $('#campo-numero-telefone-celular').val().replace p, ''
    )
  )

  $('#form-busca-local').submit(() ->
    $('#campo-numero-telefone').val(
      $('#campo-numero-telefone').val().replace p, ''
    )
  )

  # $('#form-busca-departamento').submit(() ->
  #   $('#campo-numero-telefone').val(
  #     $('#campo-numero-telefone').val().replace p, ''
  #   )
  # )
)
