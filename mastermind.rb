require "./lib/cli"
require "./lib/game"
require "./lib/sequence"
require "./output/output"

printer = Output.new

system 'clear'
app = CLI.new(printer)

Dir["./lib/*.rb"].each { |file| require "#{file}"}

app.run
