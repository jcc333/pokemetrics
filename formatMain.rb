begin
  load 'formatter.rb'

  theFormatter = Formatter.new("pokedex.csv")

  theFormatter.to_CSV()
end

