class Allergy < ActiveRecord::Base
  
  belongs_to :patient
  
  TYPES = ['Tree Nuts', 'Penicillin', 'Statin']

end
