class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end
  
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    @doctor.patients.delete(@patient)

    redirect_to(doctor_path(@doctor))
  end
end