class Killmail < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  belongs_to :victim, class_name: 'Pilot'

  has_many :involved_parties
  has_many :attackers, through: :involved_parties, source: :pilot
  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================
  def self.last_origin_id
    last.origin_id
  end
  # == Instance Methods =====================================================
end
