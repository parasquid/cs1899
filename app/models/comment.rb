class Comment < ApiModel
  attr_accessor :id

  def self.api_endpoint
    APP_CONFIG[:cs_api][:challenges]
  end

end