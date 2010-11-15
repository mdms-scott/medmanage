class Patient < ActiveRecord::Base
  
  SEX = ['Male', 'Female', 'Neither o.O']
  
  has_many :allergies, :dependent => :destroy
  
end
