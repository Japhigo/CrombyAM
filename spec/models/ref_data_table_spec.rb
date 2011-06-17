require "spec_helper"

describe RefDataTable do
  before(:each) do
    @ref_data_table = RefDataTable.find_by_table_name("genders")
  end

  context "When saving without validation" do
    it "fails DB validation with no description" do
      @ref_data_table.description = ""
      expect { @ref_date_table.save_with_validation(false) }.to raise_error
    end
  end
  
  context "when saving with validation" do
    it "fails validation with no description" do
      @ref_data_table.description = ""
      expect { @ref_date_table.save }.to raise_error
    end
  end
end
