class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable

  belongs_to :hospital

  # scope :admins, -> { where(role: 'Admin') }
  # scope :doctors, -> { where(role: 'Doctor') }
  # scope :patients, -> { where(role: 'Patient') }

  accepts_nested_attributes_for :hospital

  validates :email, uniqueness: { scope: :hospital_id }

  validates_presence_of   :email
  # validates_uniqueness_of :email, allow_blank: true
  validates_format_of     :email, with: email_regexp, allow_blank: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
