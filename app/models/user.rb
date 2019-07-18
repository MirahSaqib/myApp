class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  belongs_to :hospital

  accepts_nested_attributes_for :hospital

  def add_hospital(name, subdomain)
    build_hospital(hospital_name:name, sub_domain:subdomain)
  end

end
