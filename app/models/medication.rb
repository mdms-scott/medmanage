class Medication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :drug
end
