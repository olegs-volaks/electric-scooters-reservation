class UnsubscribesController < ApplicationController

  def show
    verifier = ActiveSupport::MessageVerifier.new(Employee.secure_key)
    employee = Employee.find(verifier.verify(params[:id]))
    employee.update_attribute(:subscribe, false)
  end

end
