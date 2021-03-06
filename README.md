# Caster [![Code Climate](https://codeclimate.com/github/patrickdavey/caster.png)](https://codeclimate.com/github/patrickdavey/caster) [![Travis](https://api.travis-ci.org/patrickdavey/caster.svg?branch=master)](https://api.travis-ci.org/patrickdavey/caster.svg?branch=master)

## What is Caster?

I find watching technical videos a good way to learn. I wanted a way to have one place where I could manage all these videos, and a place to keep notes on what I've watched. I also wanted an excuse to play a bit with Elixir & Phoenix & Vuejs ;)

Caster has built-in support for [Vimcasts](http://vimcasts.org) and custom youtube/vimeo files (using [youtube-dl](https://rg3.github.io/youtube-dl/)).  Videos are downloaded locally, and then viewed using vlc. There's a simple modal for taking notes on what you're learning.


## Installation

### Prerequisites
1. You need to have [Elixir](http://elixir-lang.org/) installed.
2. You need to have [youtube-dl](https://rg3.github.io/youtube-dl/) installed
3. You need to have a node environment setup.
3. You need to have a database (I use postgres)
3. You need to have [vlc](http://www.videolan.org/index.html) available on your path.
4. Probably some other things ;) (send a PR to update the docs)

### Setup
1. Clone this repo somewhere.
2. `$ mix deps.get`
3. `$ npm install`
4. Before moving on, configure your database in `config/dev.exs` and run:
    `$ mix ecto.create`
    `$ mix ecto.migrate`
5. Run `mix phoenix.server`

### Configration

You can configure a _few_ things at the moment, PR's definitely welcome for any RSS feeds out there. In your config/dev.secret.exs there are a few settings you can do.  Here's a sample

```elixir
config :caster,
  notes_export_file: "~/somedir/notes_file.md",
  video_export_directory: "~/Desktop/interesting_videos"

config :caster, Caster.Sources,
  local_folders: [
    %{source: :some_other_casts,
      directory: "/path-to-caster/caster/priv/downloads/foobar",
      removeable: false,
      order: [desc: :title],
      title: "FooBar",
      wildcard_match: "**/*.mov"}
  ]
```

1. notes_export_file is a file which any notes you make will be concatenated into.
2. video_export_directory is a directory where videos (marked interesting) can be copied to. Why would you bother? Well, it was handy for me to mark a few videos as interesting and then copy them off onto a phone / tablet / whatever to have handy.
3. `local_folders` just contain an array of structs that you can use to point to folders which contain videos you have already downloaded from somewhere.

### TODO / Pull Requests
1. Adding different feeds (e.g. Ruby Tapas)
2. Ability to archive casts.
3. Other cool stuff ;)

### Sample
![caster sample](https://media.giphy.com/media/xUA7bgP2YXOBomUGD6/giphy.gif)
