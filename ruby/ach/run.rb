
######################################################################
##require 'net/http'
##test_ach = Net::HTTP.get('www.fededirectory.frb.org', '/FedACHdir.txt')
##
##a = AchInstitution.new(test_ach.split.first)
##puts a.to_s
##
### db stuff, move out
##require 'sqlite3'
##dbname = "ach.db"
##
##table_name = "ach_institutions"
##db = SQLite3::Database.new(dbname)
##db.execute <<-SQL
##  create table #{table_name}(
##    routing_number string,
##    office_code string,
##    servicing_frb_number string,
##    record_type_code string,
##    change_date string,
##    new_routing_number string,
##    customer_name string,
##    address string,
##    city string,
##    state_code string,
##    zipcode string,
##    zipcode_extension string,
##    telephone_area_code char,
##    telephone_prefix_number char,
##    telephone_suffix_number char,
##    institution_status_code char,
##    data_view_code char,
##    filler char
##  );
##SQL
##
##puts a.insert_into_db_table_statement
##
###db.execute("insert into #{table_name} values (1,2,3)")
##db.execute(a.insert_into_db_table_statement)
##
##db.execute("select * from #{table_name}") do |row|
##  puts row
##end
#
