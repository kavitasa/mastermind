Dir["#{File.dirname(__FILE__)}/lib/*.rb"].each { |file| require "#{file}"}

printer = Output.new

system 'clear'
app = CLI.new(printer)

app.run
