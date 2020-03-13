require 'line/bot'

class Line::BotController < ApplicationController
  before_action :client, only: [:receive]
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:receive]

  def receive
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless @client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = @client.parse_events_from(body)
    puts events
    puts events.first
    puts events.first.source
    puts events.first.source['type']
    puts params
    puts params['events'].first['source']['type']
    if params['events'].first['source']['type'] == 'user'
      events.each do |event|
        case event
        when Line::Bot::Event::Message
          case event.type
          when Line::Bot::Event::MessageType::Text
            message = event.message['text'].strip
            if message.match(/\d{3}/)
              message = registration(message)
            elsif message.match(/.*chore.*/i)
              message = give_chore(message)
            else
            message = {
              type: 'text',
              text: "Sorry I don\'t understand that command"
            }
          end
            @client.reply_message(event['replyToken'], message)
          when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
            response = @client.get_message_content(event.message['id'])
            tf = Tempfile.open("content")
            tf.write(response.body)
          end
        end
      end
    end
    render status: 200, json: ''
  end

  private
  def give_chore(message)
    user = User.find_by(line_id: params['events'].first['source']['userId'])
    if user
      room_chore = user.room_chores.find_by(period: Period.current)
      {
        type: 'text',
        text: "Hey #{user.first_name}, your chore for this week is the #{room_chore.chore.name}."
      }
    else
      {
        type: 'text',
        text: "Sorry, I don't understand that command!"
      }
    end

  end

  def registration(message)
    user = Room.find_by(number: message.to_i).user
    if user
      user.line_id = params['events'].first['source']['userId']
      user.save
      {
        type: 'text',
        text: "Welcome #{user.first_name}, I hope you enjoy your time at Meguro Mansion! Feel free to ask me for your weekly chore anytime!"
      }
    else
      {
        type: 'text',
        text: "Sorry, I couldn't find that room number!"
      }
    end
  end

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_id = ENV["LINE_CHANNEL_ID"]
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

end
