begin
  load 'formatter.rb'

  theFormatter = Formatter.new("pokedex.csv")

  theFormatter.toCSV()
end

