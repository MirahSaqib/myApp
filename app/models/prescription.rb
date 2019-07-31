class Prescription < ActiveRecord::Base
  # attr_accessible :medicine_tokens, :doctor_name, :patient_name
  belongs_to :appointment
  belongs_to :hospital
  has_many   :prescription_medicines, dependent: :destroy
  has_many   :medicines, through: :prescription_medicines

  attr_accessor :medicine_tokens, :patient_name, :doctor_name

  def build_prescription_medicines(medicines_ids, medicine_quantities)
    self.prescription_medicines.build(prescription_medicine_hash(medicines_ids, medicine_quantities))
    self.save  
  end

  def update_prescription_medicines(medicines_ids, medicine_quantities)
    self.prescription_medicines = self.prescription_medicines.build(prescription_medicine_hash(medicines_ids, medicine_quantities))
    self.save  
  end

  def prescription_medicine_hash(ids, quantities)
    medicine_ids_array = ids.split(',')
    medicines_in_prescription = Array.new
    medicine_number = 0;
    medicine_ids_array.each do |id|
      medicines_in_prescription << { medicine_id: id.to_i, quantity: quantities[medicine_number].to_i }
      medicine_number += 1
    end
    medicines_in_prescription
  end
end
