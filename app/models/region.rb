class Region < ActiveRecord::Base
  validates :name,       presence: true, uniqueness: true
  validates :crest_id,   presence: true, uniqueness: true
  validates :crest_url,  presence: true, uniqueness: true

  has_many :systems
end
