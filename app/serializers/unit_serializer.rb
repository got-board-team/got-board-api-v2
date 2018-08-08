class UnitSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :unit_type, :house_name, :territory, :x, :y

  belongs_to :game

  def house_name
    object.house.name
  end
end
