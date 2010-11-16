
Patient.destroy_all

patient = Patient.create!(
  :last_name => 'Fredrickson',
  :first_name => 'Fred',
  :middle_name => 'Freddy',
  :dob => '1964-11-14',
  :ssn => '123456789',
  :sex => 'Male',
  :insurance => 'Blue Cross & Blue Shield',
  :attending => 'Jacob Johnson',
  :primary => 'James Brown'
)

patient = Patient.create!(
  :last_name => 'Smith',
  :first_name => 'Sarah',
  :middle_name => 'Jane',
  :dob => '1978-03-27',
  :ssn => '987654321',
  :sex => 'Female',
  :insurance => 'Blue Cross & Blue Shield',
  :attending => 'Jacob Johnson',
  :primary => 'Jill Smith'
)

drug = Drug.create!(
  :name => 'Penicillin',
  :kind => 'Antibiotic',
  :code => 'PCILLN1873',
  :generic_for => '',
  :purpose => 'General Purpose Antibiotic',
  :interactions => ["Statin", "Anti-Fungal"]
)

drug = Drug.create!(
  :name => 'Ritalin',
  :kind => 'Anti-Psychotic',
  :code => 'RIT567',
  :generic_for => '',
  :purpose => 'Controlling OCD symptoms'
)

drug = Drug.create!(
  :name => 'Atorvastatin',
  :kind => 'Statin',
  :code => 'AT432',
  :generic_for => 'Lipitor',
  :purpose => 'Cholesterol Lowering'
)