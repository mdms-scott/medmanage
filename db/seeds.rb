class Time
  def self.random(scale)
    year = Time.now.year - rand(scale)
    month = rand(12) + 1
    day = rand(31) + 1
    Time.local(year, month, day)
  end
end


10.times do
  Patient.create!(
    :last_name => Faker::Name.last_name,
    :first_name => Faker::Name.first_name,
    :middle_name => Faker::Name.first_name,
    :dob => Time.random(80),
    :ssn => 100000000 + rand(1000000000 - 100000000),
    :sex => Patient::SEX.rand,
    :insurance => Faker::Company.name,
    :attending => Faker::Name.name,
    :primary => Faker::Name.name
  )
end

Patient.all.each do |patient|
  rand(3).times do
    Allergy.create!(
      :name => Faker::Lorem.words(1).join(' '),
      :kind => Drug::TYPES.rand,
      :patient => patient
    )
  end
end

15.times do
  Drug.create!(
    :name => Faker::Lorem.words(2).join(' '),
    :kind => Drug::TYPES.rand,
    :code => 1000 + rand(99999),
    :generic_for => Faker::Lorem.words(2).join(' '),
    :purpose => Faker::Lorem.words(5).join(' '),
    :interactions => [Drug::TYPES.rand, Drug::TYPES.rand, Drug::TYPES.rand]
  )
end

Patient.all.each do |patient|
  rand(5).times do
    Medication.create!(
    :patient => patient,
    :drug => Drug.all.rand,
    :prescribing => Faker::Name.name,
    :prescription => 87236 + rand(92837498),
    :dose => 5 + rand(100 - 5) + 1,
    :quantity => rand(50) + 1,
    :filled_on => Time.random(5),
    :refills => rand(5)
    )
  end
end