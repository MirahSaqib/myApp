class Medicine < ActiveRecord::Base
  belongs_to :hospital
  has_many   :prescription_medicines
  has_many   :prescriptions, through: :prescription_medicines

  validates :name, uniqueness: { scope: :category }
  validates :category, :name, :sale_price, :quantity, presence: true

  scope :not_expired, -> { where(expired_at: nil) }
  scope :expired, -> { where.not(expired_at: nil) }
  default_scope { where(hospital_id: Hospital.current_id) }
end
