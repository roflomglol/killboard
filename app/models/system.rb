class System < ActiveRecord::Base
  validates :name,       presence: true, uniqueness: true
  validates :crest_id,   presence: true, uniqueness: true
  validates :crest_url,  presence: true, uniqueness: true

  belongs_to :region
end
