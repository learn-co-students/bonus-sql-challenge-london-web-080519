# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require 'pry'
require 'sqlite3'

DB = {:conn => SQLite3::Database.new("db/database.db")}

content = File.read('daily_show_guests.csv')
rows = content.split("\n")
rows.shift
matrix = rows.map{|row| row.split(",")}

DB[:conn].execute("DROP TABLE IF EXISTS guests")
table_creation = <<-SQL
CREATE TABLE IF NOT EXISTS guests (
    id INTEGER PRIMARY KEY,
    year INTEGER,
    cluster TEXT,
    date TEXT,
    occupation TEXT,
    name TEXT
)
SQL
DB[:conn].execute(table_creation)

insertation = "INSERT INTO guests (year, cluster, date, occupation, name) VALUES (?, ?, ?, ?, ?)"
matrix.each do |row|
    DB[:conn].execute(insertation, row[0].to_i, row[1], row[2], row[3], row[4])
end

# binding.pry
# 0