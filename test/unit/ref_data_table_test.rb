require 'test_helper'

class RefDataTableTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Database did not catch null table_name" do
    ref_data_table = RefDataTable.find_by_table_name("genders")
    ref_data_table.table_name = ""
    test_for_db_error("Database did not catch null table_name") do
      ref_data_table.save_with_validation("false")
    end
  end
end
