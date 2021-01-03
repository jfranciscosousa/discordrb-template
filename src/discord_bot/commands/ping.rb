class DiscordBot::Commands::Ping
  def initialize(event)
    @event = event
  end

  def call
    event.respond "pong"
  end

  private

  attr_reader :event
end
