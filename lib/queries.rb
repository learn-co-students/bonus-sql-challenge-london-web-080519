# Write methods that return SQL queries for each part of the challeng here
require 'sqlite3'
require 'pry'

DB = {:conn => SQLite3::Database.new("db/database.db")}

def guest_with_most_appearances
  # write your query here!
  sql = "SELECT * FROM guests GROUP BY name ORDER BY COUNT(date) DESC LIMIT 1"
  response = DB[:conn].execute(sql).flatten
end

def most_popular_profession
  sql = "SELECT occupation FROM guests GROUP BY occupation ORDER BY COUNT(date) DESC LIMIT 1"
  response = DB[:conn].execute(sql).flatten
end

def most_popular_profession_by_year
  sql = "SELECT year, occupation FROM guests GROUP BY year, occupation ORDER BY COUNT(occupation) DESC, year ASC LIMIT 17"
  response = DB[:conn].execute(sql)
end

def guests_with_name_bill
  sql = "SELECT COUNT(name) FROM guests GROUP BY name HAVING name LIKE ?"
  response = DB[:conn].execute(sql, "Bill %").flatten
end

def patrick_stewart_dates
  sql = "SELECT date FROM guests WHERE name = ?"
  response = DB[:conn].execute(sql, "Patrick Stewart")
end

def year_with_most_guests
  sql = "SELECT year FROM guests GROUP BY year ORDER BY COUNT(date) DESC LIMIT 1"
  response = DB[:conn].execute(sql).flatten
end

def most_popular_group_by_year
  sql = "SELECT year, cluster FROM guests GROUP BY year, cluster ORDER BY COUNT(cluster) DESC, year ASC LIMIT 17"
  response = DB[:conn].execute(sql)
end

binding.pry
0