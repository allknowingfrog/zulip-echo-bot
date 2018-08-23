require 'sinatra'
require 'http'

post '/' do
  request.body.rewind
  data = JSON.parse request.body.read

  auth = {
    user: ENV['ECHO_BOT_USER'],
    pass: ENV['ECHO_BOT_PASS']
  }

  url = "#{ENV['ECHO_BOT_URL']}/api/v1/messages"

  form = {
    type: 'private',
    to: data['message']['sender_email'],
    content: data['message']['rendered_content']
  }

  HTTP.basic_auth(auth).post(url, form: form)
end
