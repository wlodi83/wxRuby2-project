require "rubygems"
require 'dbi'
# make an ODBC connection
conn = DBI.connect('DBI:ODBC:exa_test','lwlodarczyk','lwl0d4rczyk')

# returns a list of the table names from your database
conn.tables

# returns an array with the resultset from your query
rs = conn.select_all('SELECT max(created_at) from ids.track_offer_clicks')
