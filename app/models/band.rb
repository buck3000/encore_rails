class Band < ActiveRecord::Base
  has_many :concerts
  has_many :songs
  # validates :name, presence: true, uniqueness: true
end
