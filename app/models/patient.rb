class Patient < ActiveRecord::Base
  
  SEX = ['Male', 'Female', 'Neither o.O']
  
  has_many :allergies, :dependent => :destroy
  has_many :medications, :dependent => :destroy
  has_many :drugs, :through => :medications
  
  validates_presence_of :last_name, :first_name, :dob, :sex, :ssn, :insurance, :primary
  validates_uniqueness_of :ssn
  
end
