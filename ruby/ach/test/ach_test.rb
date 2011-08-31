require File.expand_path('../../lib/ach_institution', __FILE__)
require 'test/unit'

class AchTest < Test::Unit::TestCase
  def setup
    @ach_hash = {
      "routing_number" => "123456789",
      "office_code" => "A",
      "servicing_frb_number" => "987654321",
      "record_type_code" => "B",
      "change_date" => "010203",
      "new_routing_number" => "135792468",
      "customer_name" => "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      "address" => "0987654321ZYXWVUTSRQPONMLKJIHGFEDCBA",
      "city" => "ABCDEFGHIJ9753186420",
      "state_code" => "ZZ",
      "zipcode" => "54321",
      "zipcode_extension" => "9876",
      "telephone_area_code" => "281",
      "telephone_prefix_number" => "330",
      "telephone_suffix_number" => "8004",
      "institution_status_code" => "X",
      "data_view_code" => "Y",
      "filler" => "     "
    }
    @ach_instution = AchInstitution.new(@ach_hash.values.join)
  end

  def test_should_get_fields
    @ach_hash.each do |k,v|
      assert_equal v, eval(%Q{@ach_instution.#{k}})
    end
  end

  def test_should_get_db_string
    str = "INSERT INTO ach_institutions VALUES (\""
    str += @ach_hash.values.join(%Q{","})
    str += "\")"
    assert_equal str, @ach_instution.insert_into_db_table_statement
  end

  def test_should_transact_with_db

    # create database
    dbname = "test.db"

    # ensure database is destroyed
    begin
      db = SQLite3::Database.new(dbname)
    rescue
    ensure
      File.delete(dbname)
    end

  end
end

