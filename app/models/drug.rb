class Drug < ActiveRecord::Base
  
  before_create :set_interaction_defaults
  
  TYPES = ['Antibiotic', 'Statin', 'Anti-Fungal', 'Anti-Histamine', 'Anti-Depressant', 'Sedative', 'Anti-Psychotic']
  
  serialize :interactions
  

  
  def set_interaction_defaults
    self.interactions = ['']
  end
  
  def self.interacts_with(drugs)
    @kinds = ['']
    drugs.each do |drug|
      @kinds << drug.kind
      puts @kinds
    end
    drugs.each do |drug|
      drug.interactions.each do |interaction|
        if @kinds.include?(interaction)
          puts 'there are interactions'
        else
          puts 'there are no interactions'
        end
      end
    end
    return 'poo'
  end
  
  #def self.types
  #  @types = TYPES
  #  @types
  #end
  
end
