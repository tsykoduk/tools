#export PS1="%~ %* ☯ "
export PS1="%~ ☯ "

export CLICOLOR=1
#export LSCOLORS=dxfxcxdxbxegedabagacad

#For GNU utils
#alias ls="ls --color"

### Added for Homebrew
PATH=/usr/local/bin:$PATH
### Added to install the GNU toolset
#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
### Added for rubygems + homebrew support
export PATH=$(brew --prefix ruby)/bin:$PATH
#Support for Ruby Gems
export PATH=/usr/local/opt/ruby/bin:$PATH
#we need to flow this with the current ruby version I guess?
export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
### Added for Python under Homebrew
### Removed because ¯\_(ツ)_/¯ python
#PATH=/usr/local/share/python:$PATH

#source .bashrc

PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export EDITOR=mate
export PATH=/usr/local/sbin:$PATH

#Let's get nano running with COLOR -- Also need to set up ~/.nanorc

alias nano='/usr/local/bin/nano --tabstospaces'

# Let's try and find a better way

echo "186,000 Miles Per Second. Not only a good idea, It's the law!" | cowthink | lolcat
echo ""
echo ""

# fortune -s | cowthink | lolcat

