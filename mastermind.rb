require "./lib/cli"
require "./lib/game"
require "./lib/sequence"
require "./output/output"

printer = Output.new

app = CLI.new(printer)
app.run
