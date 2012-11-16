class ApiModel
  include ActiveModel::Model

  # Overrides the attr_accesssor class method so we are able to capture and
  # then save the defined fields as column_names
  def self.attr_accessor(*vars)
    @column_names ||= []
    @column_names.concat( vars )
    super
  end

  # Returns the previously defined attr_accessor fields
  def self.column_names
    @column_names
  end

  # Returns the api_endpoint. Note that you need to implement this method
  # in the child object
  def self.api_endpoint
    raise 'Please implement ::api_endpoint in the child object'
  end

  # Returns all the records from the CloudSpokes API
  def self.all
    raw_get.map { |item| new item }
  end

  # Returns the first record
  # TODO: when the API supports it, simply request for the first record.
  # There should be no need to request for all the records first.
  def self.first
    all.first
  end

  # Finds an entity
  def self.find(entity)
    Kernel.const_get(self.name).new(raw_get entity)
  end

  # Wrap initialize with a sanitation clause
  def initialize(params={})
    params.delete_if {|k, v| !self.class.column_names.include? k.to_sym}
    super(params)
  end

  # Returns if this record has the id attribute set (used by url_for for routing)
  def persisted?
    !!id
  end

  # Convenience method to request an entity from the CloudSpokes RESTful source
  def self.raw_get(entity = '')
   # we're only interested in the response portion of the reply
    Hashie::Mash.new(JSON.parse(RestClient.get "#{api_endpoint}/#{entity}")).response
  end

  # Sanitized response to only the attributes we've defined
  def self.get(entity = '')
    raw_get(entity).delete_if {|k, v| !column_names.include? k.to_sym}
  end

end