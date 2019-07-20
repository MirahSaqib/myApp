class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  belongs_to :hospital

  accepts_nested_attributes_for :hospital

  validates :email, uniqueness: { scope: :hospital_id }

  validates_presence_of   :email
  # validates_uniqueness_of :email, allow_blank: true
  validates_format_of     :email, with: email_regexp, allow_blank: true

  def add_hospital(name, subdomain)
    build_hospital(hospital_name: name, sub_domain: subdomain)
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
