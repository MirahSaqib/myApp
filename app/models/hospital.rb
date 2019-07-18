class Hospital < ActiveRecord::Base
  has_many :users

  validates_uniqueness_of [:hospital_name, :sub_domain]

  def self.current_id=(id)
    Thread.current[:hospital_id] = id
  end

  def self.current_id
    Thread.current[:hospital_id]
  end
end
