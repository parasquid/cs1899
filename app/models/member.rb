class Member < ApiModel
  attr_accessor :id, :name, :profile_pic, :attributes,
    :challenges_entered, :active_challenges,
    :total_1st_place, :total_2nd_place, :total_3st_place,
    :total_wins, :total_public_money,
    :summary_bio, :payments

  has_many :recommendations
  habtm :challenges, parent: Member

  def self.api_endpoint
    APP_CONFIG[:cs_api][:members]
  end

  # Used for resourceful routes (instead of id)
  def to_param
    name
  end

  # has_many :payments
  # Note that the json does not expose this method
  # TODO (this requires authentication)
  def payments
    'nil'
  end

end

# http://cs-api-sandbox.herokuapp.com/v1/members/cloudspokes-rspec-1

# {
#     "attributes": {
#         "type": "Member__c",
#         "url": "/services/data/v22.0/sobjects/Member__c/a0IJ0000000eil5MAA"
#     },
#     "name": "cloudspokes-rspec-1",
#     "challenges_entered": 0,
#     "total_2nd_place": 0,
#     "active_challenges": 0,
#     "total_1st_place": 0,
#     "id": "a0IJ0000000eil5MAA",
#     "total_wins": 0,
#     "total_public_money": 0.0,
#     "total_3st_place": 0,
#     "profile_pic": "http://cloudspokes.s3.amazonaws.com/Cloud_th_100.jpg"
# },
