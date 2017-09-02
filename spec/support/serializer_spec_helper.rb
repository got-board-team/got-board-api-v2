module SerializerSpecHelper
  def serialize(object, options = {})
    serializer_class = options.delete(:serializer_class) || "#{object.class.name}Serializer".constantize
    serializer = serializer_class.send(:new, object)
    adapter = ActiveModel::Serializer::Adapter.create(serializer, options)
    JSON.parse(adapter.to_json)
  end
end
