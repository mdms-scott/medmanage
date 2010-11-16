class Drug < ActiveRecord::Base
  
  TYPES = ['Analgesic', 'Antacid', 'Anti-Coagulant', 'Anti-Convulsant', 'Anti-Depressant', 'Anti-Diarrheal', 'Anti-Fungal', 'Anti-Histamine', 'Anti-Psychotic', 'Anti_Viral', 'Antibiotic', 'Bronchodilator', 'Decongestant', 'Diuretic', 'Heparin', 'Hormone', 'Laxitive', 'Leprostatic', 'Muscle Relaxant', 'Nitrate', 'Sedative', 'Statin', 'Steroid', 'Vasoconstictor', 'Vasodilator']

  validates_presence_of :name, :kind, :code, :purpose
  validates_uniqueness_of :interactions
  
  serialize :interactions
  
  def self.interacts_with(drugs)
    kinds = []
    @interactions = []
    drugs.each do |drug|
      kinds << drug.kind
    end
    #puts kinds
    drugs.each do |drug|
      drug.interactions.each do |interaction|
        if kinds.include?(interaction)
          #puts "#{drug.name} has an interaction with another assigned prescription"
          @interactions << "Warning!  #{drug.name} may have an interaction with another assigned prescription!"
        end
      end
    end
    return @interactions
  end
  
  def self.allergies_to(drugs, allergies)
    allergy_kinds = []
    @allergic = []
    allergies.each do |allergy|
      allergy_kinds << allergy.kind
    end
    #puts allergy_kinds
    drugs.each do |drug|
      if allergy_kinds.include?(drug.kind)
        #puts "Warning!  The patient may be allergic to #{drug.name}!"
        @allergic << "Warning!  The patient may be allergic to #{drug.name}!"
      end
    end
    return @allergic
  end
  
end
