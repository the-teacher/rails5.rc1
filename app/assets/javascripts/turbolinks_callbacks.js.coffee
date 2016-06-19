TheLog.init()

if Turbolinks?.supported
  log """
    turbolinks:click
    turbolinks:before-visit
    turbolinks:visit
    turbolinks:request-start
    turbolinks:request-end
    turbolinks:before-cache
    turbolinks:before-render
    turbolinks:render
    turbolinks:load
  """

$ ->
  log '?'
  console.log 'Hello World!'
