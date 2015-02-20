# Ekumenlabs.com


## Enviroment Setup

Install Ruby. I suggest to use [rvm](https://rvm.io/).

This is what I did to get Ruby up and running on my Ubuntu 14.04.
If you're using Gnome terminal you may have to [change your settings to
run commands as a login shell](https://rvm.io/integration/gnome-terminal).

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby # Install Ruby stable
source ~/.rvm/scripts/rvm # Get the rvm command
rvm list # Rvm installed Ruby 2.2.0, so I'm going to set that as default
rvm --default use 2.2.0 # To get ruby 2.2.0 when opening a new terminal
```

## Install nodejs

sudo apt-get install nodejs nodejs-legacy

## Install Bundler (it's Ruby's version of npm)

`gem install bundler`

## And then project dependencies

`bundle install`

## Contributing

To run the website in your computer

`middleman`

To build the static version of the website

`middleman build`

To deploy the generated static version

`middleman deploy`
