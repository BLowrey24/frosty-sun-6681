require 'rails_helper'

RSpec.describe 'Doctors show page', type: :feature do
  before(:each) do
    @hospital = Hospital.create!(name: "Hospital")
    @doctor1 = @hospital.doctors.create!(name: "Doctor1", specialty: "Surgery", university: "University of being a doctor")
    @doctor2 = @hospital.doctors.create!(name: "Doctor2", specialty: "Patient help", university: "University of being a sorta good doctor")

    visit doctor_path(@doctor1)
  end
  describe 'when I visit the doctors show page' do
    it 'then I see all the doctors information' do
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content("Specialty: #{@doctor1.specialty}")
      expect(page).to have_content("University: #{@doctor1.university}")
    end
  end
end