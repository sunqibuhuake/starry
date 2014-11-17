$ = require 'jquery'
require '../../components/csrf'

_alert = require '../../templates/components/alert.hbs'

$ ->
  $form = $ '#formSignup'
  $inputs = $form.find '.inputs'
  $submit = $form.find 'button[type="submit"]'

  $form.on 'submit', (event) ->
    event.preventDefault()
    $submit.button 'loading'
    $.ajax
      url: '/api/signup'
      type: 'POST'
      data: $form.serialize()
      dataType: 'json'
    .done (res) ->
      $submit.button 'reset'
      window.location.href = '/'
    .fail (res) ->
      $submit.button 'reset'
      error = res.responseJSON.error
      if typeof error is 'string' then errors = [error] else errors = (err.msg for err in error)
      $alert = $(_alert errors: errors).addClass 'alert-danger'
      $_alert = $inputs.prev '.alert'
      if $_alert.size() then $_alert.replaceWith $alert else $inputs.before $alert
