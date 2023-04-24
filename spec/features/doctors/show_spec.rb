require 'rails_helper'

RSpec.describe 'Doctors show page', type: :feature do
  before(:each) do
    @hospital1 = Hospital.create!(name: "Hospital1")
    @hospital2 = Hospital.create!(name: "Hospital2")
    @doctor1 = @hospital1.doctors.create!(name: "Doctor1", specialty: "Surgery", university: "University of being a doctor")
    @doctor2 = @hospital2.doctors.create!(name: "Doctor2", specialty: "Patient help", university: "University of being a sorta good doctor")
    @patient1 = Patient.create!(name: "Patient1", age: 18)
    @patient2 = Patient.create!(name: "Patient2", age: 30)
    @patient3 = Patient.create!(name: "Patient3", age: 25)
    DoctorPatient.create!(doctor: @doctor1, patient: @patient1)
    DoctorPatient.create!(doctor: @doctor1, patient: @patient2)
    DoctorPatient.create!(doctor: @doctor2, patient: @patient3)
    visit doctor_path(@doctor1)
  end
  describe 'when I visit the doctors show page' do
    it 'then I see all the doctors main attributes' do
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content("Specialty: #{@doctor1.specialty}")
      expect(page).to have_content("University: #{@doctor1.university}")

      expect(page).to_not have_content(@doctor2.name)
      expect(page).to_not have_content("Specialty: #{@doctor2.specialty}")
      expect(page).to_not have_content("University: #{@doctor2.university}")
    end

    it 'I also see where the doctor works and the name of their patients' do
      expect(page).to have_content("Hospital: #{@hospital1.name}")
      expect(page).to_not have_content("Hospital: #{@hospital2.name}")
      
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to_not have_content(@patient3.name)
    end
  end
end