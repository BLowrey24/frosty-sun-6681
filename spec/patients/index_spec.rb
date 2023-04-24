require 'rails_helper'

RSpec.describe 'Patient index page',type: :feature do
  before(:each) do
    @patient1 = Patient.create!(name: 'Zoe', age: 5)
    @patient2 = Patient.create!(name: 'Anna', age: 25)
    @patient3 = Patient.create!(name: 'Bobby', age: 2)
    @patient4 = Patient.create!(name: 'Lee', age: 17)
    @patient5 = Patient.create!(name: 'Aby', age: 40)
    @patient6 = Patient.create!(name: 'Boston', age: 19)
    visit patients_path
  end
  
  describe 'when I visit the patient index page' do
    it 'then I see the names of all adult patients (age is greater than 18)' do
      expect(@patient5.name).to appear_before(@patient2.name)
      expect(@patient2.name).to appear_before(@patient6.name)

      expect(@patient6.name).to_not appear_before(@patient2.name)
      expect(@patient2.name).to_not appear_before(@patient5.name)

      expect(page).to_not have_content(@patient1.name)
      expect(page).to_not have_content(@patient3.name)
      expect(page).to_not have_content(@patient4.name)
    end
  end
end