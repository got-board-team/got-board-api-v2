module SerializerSpecHelper
  def serialize(object, options = {})
    serializer_class = options.delete(:serializer_class) || "#{object.class.name}Serializer".constantize
    serializer = serializer_class.send(:new, object)

    JSON.parse(serializer.serialized_json)
  end
end
