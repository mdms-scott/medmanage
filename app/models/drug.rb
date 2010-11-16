class Drug < ActiveRecord::Base
  
  before_create :set_interaction_defaults
  
  TYPES = ['Antibiotic', 'Statin', 'Anti-Fungal', 'Anti-Histamine', 'Anti-Depressant', 'Sedative', 'Anti-Psychotic']
  
  serialize :interactions
  

  
  def set_interaction_defaults
    self.interactions = ['']
  end
  
  def self.interacts_with(drugs)
    @kinds = ['']
    @interactions = ['']
    drugs.each do |drug|
      @kinds << drug.kind
    end
    #puts @kinds
    drugs.each do |drug|
      drug.interactions.each do |interaction|
        if @kinds.include?(interaction)
          #puts "#{drug.name} has an interaction with another assigned prescription"
          @interactions << "#{drug.name} has an interaction with another assigned prescription"
        end
      end
    end
    return @interactions
  end
  
  #def self.types
  #  @types = TYPES
  #  @types
  #end
  
end
