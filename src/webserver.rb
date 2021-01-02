class Webserver < Sinatra::Base
  set :views, "#{File.dirname(__FILE__)}/webserver/views"

  get "/" do
    @url = DiscordBot.invite_url

    erb :index
  end
end
