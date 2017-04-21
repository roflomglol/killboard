class Region < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  has_many :systems
  # == Validations ==========================================================
  validates :name,       presence: true, uniqueness: true
  validates :crest_id,   presence: true, uniqueness: true
  validates :crest_url,  presence: true, uniqueness: true
  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
