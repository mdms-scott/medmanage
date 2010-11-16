class Allergy < ActiveRecord::Base
  
  belongs_to :patient
  
  validates_presence_of :name, :kind, :patient_id

end
