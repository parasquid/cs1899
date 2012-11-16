class Recommendation < ApiModel
  attr_accessor :id

  def self.api_endpoint
    APP_CONFIG[:cs_api][:members]
  end

end