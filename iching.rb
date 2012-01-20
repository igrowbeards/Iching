require 'sqlite3'

db = SQLite3::Database.open( "hexagrams.sqlite" )

hexagram = []

6.times do 
    x = rand(2)
    
    hexagram.push(x)

    if x == 1
        puts '----------'
    else
        puts '----  ----'
    end
end

hex_string = hexagram.join.to_s
puts hex_string.to_i(2)
results = db.execute("select * from hexagrams where binary='#{hex_string}'")
puts results
