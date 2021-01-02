# discordrb-template

This is simple starter repo to make Discord bots using `discordrb` and host then on Heroku, using a `sinatra` powered webserver to maintain the Heroku app alive. The webserver renders a page with the bot's invite url.

All of this work is behind my blog post on how to make and host discord bots with minimal financial investment. Check it out [here](https://jfranciscosousa.com/blog/posts/building-and-hosting-discord-bots).

## Pre-requisites

Make sure you have `ruby 3.0.0` and that's it. The `bin/setup` script will use `asdf` if it's available. I recommend it. Any other ruby version manage will work.

## Architecture

Very simply, the app is composed of two main entry points. `bot` and `web`. You can run both using `rake`.

`rake bot` opens a websocket connection with discord, listening to all messages of its connected servers. The servers you've invited the bot into.

`rake web` boots up a `Rack` powered webserver. We use `sinatra` to code it's behavior. Currently, it renders just a simple webpage with the bot invite url. You can do whatever you want with it though.

All of the code in the `src` folder is loaded "Rails-style". We are using `Zeitwerk` to load everything based on its file structure. So we expect that the `src/webserver.rb` file defines a `Webserver` class. Nesting is also expected, so a file in `src/webserver/random_class.rb` would expect a `Webserver::RandomClass` inside. We also load every gem on the gemfile during the script startup. All of this works as long as you kick things off with the defined `rake` tasks.

To host it on Heroku for free we need a dedicated verified account (you verify it with a credit card). We can only use one dyno though (one Heroku process basically). For that, we have the `rake all` task, which runs `bot` and `web` at the same time. With this we only use on dyno on Heroku, effectively doing this for free. Also, you need to ping the web app every 5 minutes, otherwise, it goes to sleep.

This is "free" hosting. It's incredible underpowered and with enough connected servers, it might just implode and crash. During development, we run two separate processes. Check the `Procfile.dev`. That's the best way to go about it, but you would need to pay for your dynos. Also, the free dynos are pretty small, just 1 GB of RAM. That ain't gonna cut it.

You can always skip Heroku anyway. If you know your way around this, host it however you like.

## Scripts

`bin/setup` runs the setup.

`bin/server` starts the development server.

`bin/lint` runs the linter.

## Github Actions

By default `rubocop` is running in Github Actions. This is for my own sake. After cloning this repo for your projects, feel free to delete it. If you want to disable the Github Actions, just delete the `.github` folder.

## Future stuff

I might add stuff for testing later. Probably `rspec`.

## Contributing

Issues are welcome. PRs are welcome. Feel free to suggest stuff here. Remember that all of this is pretty opinionated and tied to Heroku.

You can reach me via email at [francisco.sousa@hey.com](mailto:francisco.sousa@hey.com) for any specific question.
