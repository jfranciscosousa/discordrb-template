module DiscordBot
  throw "Lacking required secrets!" unless ENV["TOKEN"] && ENV["CLIENT_ID"]

  @bot = Discordrb::Bot.new(
    token: ENV["TOKEN"],
    client_id: ENV["CLIENT_ID"],
  )

  puts "This bot's invite URL is #{@bot.invite_url}"
  puts "Click on it to invite it to your server"

  @bot.message(with_text: "!ping") do |event|
    DiscordBot::Commands::Ping.new(event).call
  end

  def self.run
    @bot.run
  end

  def self.invite_url
    @bot.invite_url
  end
end
