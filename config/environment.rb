require 'bundler'
Bundler.require
require_relative '../db/seed.rb'
require_relative '../lib/queries.rb'
require 'sqlite3'

# Setup a DB connection here
DB = {:conn => SQLite3::Database.new("db/database.db")}