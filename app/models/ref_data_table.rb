class RefDataTable < ActiveRecord::Base
  set_table_name "cin.ref_data_tables"
  
  attr_accessible :description, :description_mandatory, :code_min_length, :code_max_length, :code_mandatory,
                  :code_format, :updated_by
  attr_readonly :table_name, :created_by, :created_at, :updated_at
  
  validates_presence_of :description
  validates_length_of :description, :maximum => 255
  validates_numericality_of :code_min_length, :only_integer => true, :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10
  validates_numericality_of :code_max_length, :only_integer => true, :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10    
  validate :validate_bounds!
  validates_length_of :code_format, :maximum => 255
  
protected

  def validate_bounds!
    errors.add(:code_min_length, "must be less than or equal to the maximum") if self.code_min_length > self.code_max_length
  end
  
end
