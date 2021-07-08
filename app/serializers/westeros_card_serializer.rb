class WesterosCardSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :title

  attribute :deck_tier do |object|
    object.westeros_deck.tier
  end
end
