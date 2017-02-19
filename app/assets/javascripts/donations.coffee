# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  stripeResponseHandler = undefined
  $cardForm = undefined
  $cardForm = $('#card-details')

  stripeResponseHandler = (status, response) ->
    if response.error
      $cardForm.find('.payment-errors').text response.error.message
      $cardForm.find('input[type=submit]').prop 'disabled', false
    else
      token = response.id
      $cardForm.append $('<input type="hidden" name="stripe_token"/>').val(token)
      $cardForm.get(0).submit()
    return

  $cardForm.submit ->
    Stripe.card.createToken this, stripeResponseHandler
    false
  return
