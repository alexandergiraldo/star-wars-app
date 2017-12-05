class CharacterSerializer
  include ActiveModel::Serializers::JSON
  attr_accessor :name, :gender, :vehicles, :homeworld, :birth_year

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value) rescue nil
    end
  end

  def attributes
    instance_values
  end

  def vehicles_list
    _vehicles = self.vehicles.presence || []
    list = []
    list.tap do |l|
      _vehicles.each do |vehicle|
        request = HTTParty.get(vehicle, query: {format: 'json'})
        request.success? ? l.append(OpenStruct.new(request.parsed_response)) : nil
      end
    end
  end

  def _homeworld
    request = HTTParty.get(homeworld, query: {format: 'json'})
    request.success? ? request.parsed_response['name'] : nil
  end
end
