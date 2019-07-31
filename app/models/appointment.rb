class Appointment < ActiveRecord::Base
  belongs_to :patient, class_name: 'User::Doctor'
  belongs_to :doctor, class_name: 'User::Patient'
  belongs_to :hospital
  has_one    :prescription
end
