class Hospital < ActiveRecord::Base
  has_many :users, dependent: :destroy

  validates_uniqueness_of %i[hospital_name sub_domain]

  delegate :admins, :doctors, :patients, to: :users

  def self.current_id=(id)
    Thread.current[:hospital_id] = id
  end

  def self.current_id
    Thread.current[:hospital_id]
  end
end
