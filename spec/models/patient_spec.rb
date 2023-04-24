require 'rails_helper'

RSpec.describe Patient do
  before(:each) do
    @patient1 = Patient.create(name: 'Zoe', age: 30)
    @patient2 = Patient.create(name: 'Anna', age: 25)
    @patient3 = Patient.create(name: 'Bobby', age: 10)
  end
  describe 'relationships' do
    it {should have_many(:doctor_patients)}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'class methods' do
    describe '.adults_in_alphabetical_order' do  
      it 'returns adult patients in alphabetical order' do
        expect(described_class.adults_in_alphabetical_order).to eq([@adult_patient2, @adult_patient1])
      end
    end
  end
end