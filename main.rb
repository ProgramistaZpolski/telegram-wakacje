require 'telegram/bot'

token = "YOUR_TOKEN_HERE";

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, remember to comment like and subscribe and to tell
 me in the comments why you think that navroad nexo avio is the best tablet ever made for a chance to win a chance to get a navroad tablet")

      Thread.new {
        deadline = Time.new(2022, 8, 5, 23, 17, 50, "+01:00")
        while Time.now < deadline do
          puts Time.now.to_i, deadline.to_i
          d = deadline.to_i - Time.now.to_i
          seconds = (d % 60).round
          minutes = (d % (60 * 60) / 60).round
          hours = (d % (60 * 60 * 24) / (60 * 60)).round
          days = (d / (60 * 60 * 24)).round
          weeks = (days / 7).round
          months = (weeks / 4).round

          bot.api.send_message(chat_id: message.chat.id, text: "Pozostało #{days} dni, #{hours} godzin, #{minutes} minut i #{seconds} sekund do unlocku poco")
          sleep 10800
        end
      }
    end
  end
end
