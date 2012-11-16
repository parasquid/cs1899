class ApiModel
  include ActiveModel::Model

  def self.attr_accessor(*vars)
    @column_names ||= []
    @column_names.concat( vars )
    super
  end

  def self.column_names
    @column_names
  end

  def self.api_endpoint
    raise 'Please implement ::api_endpoint in the child object'
  end

  def self.all
    Hashie::Mash.new(JSON.parse(RestClient.get api_endpoint)).response.map do |item|
      self.new(item.to_hash)
    end
  end

  def persisted?
    !!id
  end

end