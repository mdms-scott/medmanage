class Patient < ActiveRecord::Base
  
  SEX = ['Male', 'Female', 'Neither o.O']
  
  has_many :allergies, :dependent => :destroy
  has_many :medications, :dependent => :destroy
  has_many :drugs, :through => :medications
  
end
