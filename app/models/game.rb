class Game < ApplicationRecord
  has_many :houses

  has_many :house_cards
  has_many :wildling_cards, -> { order(position: :asc) }

  has_many :tokens
  has_many :fiefdom_tokens
  has_many :kings_court_tokens
  has_many :iron_throne_tokens
  has_many :supply_tokens
  has_many :victory_tokens

  has_many :orders
  has_many :march_orders
  has_many :support_orders
  has_many :raid_orders
  has_many :defense_orders
  has_many :consolidation_orders

  has_many :units
  has_many :footmen
  has_many :knights
  has_many :ships
  has_many :siege_engines

  has_many :power_tokens

  has_many :neutral_force_tokens

  has_many :garrison_tokens

  validates_numericality_of :round, greater_than: 0, less_than: 11
  validates_numericality_of :wildling_threat, greater_than_or_equal_to: 0, less_than: 13, even: true

  def territories
    @territories ||= Territory.all
  end

  def territory_ids
    @territory_ids ||= Territory.pluck(:id)
  end

  def influence_tokens
    @influence_tokens ||= tokens.where(type: %w[IronThroneToken KingsCourtToken FiefdomToken])
  end

  def influence_token_ids
    influence_tokens.pluck(:id)
  end
end
