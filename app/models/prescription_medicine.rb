class PrescriptionMedicine < ActiveRecord::Base
  belongs_to :medicine
  belongs_to :prescription
  belongs_to :hospital
end
