class Drug < ActiveRecord::Base
  
  before_create :set_interaction_defaults
  
  TYPES = ['Antibiotic', 'Statin', 'Anti-Fungal', 'Anti-Histamine', 'Anti-Depressant', 'Sedative', 'Anti-Psychotic']
  
  serialize :interactions
  

  
  def set_interaction_defaults
    self.interactions = ['']
  end
  
  #def self.types
  #  @types = TYPES
  #  @types
  #end
  
end
