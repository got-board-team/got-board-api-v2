class PowerTokenSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :available, :territory, :house_name, :x, :y

  def house_name
    object.house.name
  end
end
