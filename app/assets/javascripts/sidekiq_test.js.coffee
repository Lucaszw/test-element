# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
source = new EventSource('/sidekiq_test/events')
source.addEventListener 'message', (e) -> 
  alert "Hello"
  
  #$.parseJSON(e.data.text)