class Medication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :drug
  
  validates_presence_of :patient_id, :drug_id, :prescribing, :prescription, :dose, :quantity, :filled_on, :refills
end
