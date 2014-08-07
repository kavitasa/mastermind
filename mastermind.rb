require "./lib/cli"        # ~> LoadError: cannot load such file -- ./lib/cli
require "./lib/game"
require "./lib/sequence"
require "./output/output"

printer = Output.new

system 'clear'
app = CLI.new(printer)
app.run

# ~> LoadError
# ~> cannot load such file -- ./lib/cli
# ~>
# ~> /Users/kavita/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
# ~> /Users/kavita/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/rubygems/core_ext/kernel_require.rb:55:in `require'
# ~> /Users/kavita/documents/turing/Aug01/mastermind/mastermind.rb:1:in `<main>'
