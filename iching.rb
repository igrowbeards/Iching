    require 'sqlite3'
    require 'ap'

    @db = SQLite3::Database.open('hexagrams.sqlite')

    def get_all_hex
        @db.results_as_hash = true
        @all_hex = @db.execute("select * from hexagrams")
    end

    all_hex = get_all_hex

    puts 'class Hexagram' 

    all_hex.each do |r|
        name = r['name'].downcase!
        components = r['components']
        binary = r['binary']
        summary = r['summary']
        body = r['body']
        
        
        puts "def #{name}"
        puts "  #{name} = <<-'HEX'"
        puts "    #{name}".upcase
        puts "    #{binary}"
        puts "    #{components}"
        puts "    "
        puts "    #{summary}"
        puts "    "
        lines = body.split('.')
        lines.each do |line|
            more_lines = line.split('!')
            puts "    #{line}."
        end
        puts "  HEX"
        puts "end"
        puts ""
    end

    puts 'end'
    
