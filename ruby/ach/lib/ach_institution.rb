require 'sqlite3'

class AchInstitution
  fields_hash = {
      "routing_number" => 9,
      "office_code" => 1,
      "servicing_frb_number" => 9,
      "record_type_code" => 1,
      "change_date" => 6,
      "new_routing_number" => 9,
      "customer_name" => 36,
      "address" => 36,
      "city" => 36,
      "state_code" => 2,
      "zipcode" => 5,
      "zipcode_extension" => 4,
      "telephone_area_code" => 3,
      "telephone_prefix_number" => 3,
      "telephone_suffix_number" => 4,
      "institution_status_code" => 1,
      "data_view_code" => 1,
      "filler" => 5
  }

  attr_accessor :routing_number,          # 1-9, 9
                :office_code,             # 10 (1)
                :servicing_frb_number,    # 11-19 (9)
                :record_type_code,        # 20 (1)
                :change_date,             # 21-26 (6)
                :new_routing_number,      # 27-35 (9)
                :customer_name,           # 36-71 (36)
                :address,                 # 72-107 (36)
                :city,                    # 108-127 (20)
                :state_code,              # 128-129 (2)
                :zipcode,                 # 130-134 (5)
                :zipcode_extension,       # 135-138 (4)
                :telephone_area_code,     # 139-141 (3)
                :telephone_prefix_number, # 142-144 (3)
                :telephone_suffix_number, # 145-148 (4)
                :institution_status_code, # 149 (1)
                :data_view_code,          # 150 (1)
                :filler                   # 151-155 (5)

  def initialize(ach_string)
    self.routing_number          = ach_string[0..8]
    self.office_code             = ach_string[9]
    self.servicing_frb_number    = ach_string[10..18]
    self.record_type_code        = ach_string[19]
    self.change_date             = ach_string[20..25]
    self.new_routing_number      = ach_string[26..34]
    self.customer_name           = ach_string[35..70]
    self.address                 = ach_string[71..106]
    self.city                    = ach_string[107..126]
    self.state_code              = ach_string[127..128]
    self.zipcode                 = ach_string[129..133]
    self.zipcode_extension       = ach_string[134..137]
    self.telephone_area_code     = ach_string[138..140]
    self.telephone_prefix_number = ach_string[141..143]
    self.telephone_suffix_number = ach_string[144..147]
    self.institution_status_code = ach_string[148]
    self.data_view_code          = ach_string[149]
    self.filler                  = ach_string[150..154]
  end

  def to_s
    pad = 25

    "Routing Number:".ljust(pad)          + "[#{routing_number}]\n" +
    "Ofice Code:".ljust(pad)              + "[#{office_code}]\n" +
    "Servicing FRB Number:".ljust(pad)    + "[#{servicing_frb_number}]\n" +
    "Record Type Code:".ljust(pad)        + "[#{record_type_code}]\n" + 
    "Change Date:".ljust(pad)             + "[#{change_date}]\n" +
    "New Routing Number:".ljust(pad)      + "[#{new_routing_number}]\n" +
    "Customer Name:".ljust(pad)           + "[#{customer_name}]\n" +
    "Address:".ljust(pad)                 + "[#{address}]\n" +
    "City:".ljust(pad)                    + "[#{city}]\n" +
    "State Code:".ljust(pad)              + "[#{state_code}]\n" + 
    "Zipcode:".ljust(pad)                 + "[#{zipcode}]\n" + 
    "Zipcode Extension:".ljust(pad)       + "[#{zipcode_extension}]\n" +
    "Telephone Area Code:".ljust(pad)     + "[#{telephone_area_code}]\n" +
    "Telephone Prefix Number:".ljust(pad) + "[#{telephone_prefix_number}]\n" +
    "Telephone Suffix Number:".ljust(pad) + "[#{telephone_suffix_number}]\n" +
    "Institution Status Code:".ljust(pad) + "[#{institution_status_code}]\n" +
    "Data View Code:".ljust(pad)          + "[#{data_view_code}]\n" +
    "Filler:".ljust(pad)                  + "[#{filler}]\n"
  end

  def insert_into_db_table_statement
    table = "ach_institutions"
    "INSERT INTO #{table} " +
    "VALUES (" +
    "\"#{routing_number}\"," +
    "\"#{office_code}\"," +
    "\"#{servicing_frb_number}\"," +
    "\"#{record_type_code}\"," +
    "\"#{change_date}\"," +
    "\"#{new_routing_number}\"," +
    "\"#{customer_name}\"," +
    "\"#{address}\"," +
    "\"#{city}\"," +
    "\"#{state_code}\"," +
    "\"#{zipcode}\"," +
    "\"#{zipcode_extension}\"," +
    "\"#{telephone_area_code}\"," +
    "\"#{telephone_prefix_number}\"," +
    "\"#{telephone_suffix_number}\"," +
    "\"#{institution_status_code}\"," +
    "\"#{data_view_code}\"," +
    "\"#{filler}\"" +
    ")"
  end
end
