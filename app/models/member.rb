class Member < ApiModel
  def to_param
    name
  end

  attr_accessor :id, :name, :profile_pic, :attributes,
    :challenges_entered, :active_challenges,
    :total_1st_place, :total_2nd_place, :total_3st_place,
    :total_wins, :total_public_money,
    :summary_bio

  def self.api_endpoint
    APP_CONFIG[:cs_api][:members]
  end

  def self.find(member_name)
    member = Hashie::Mash.new(JSON.parse(RestClient.get "#{api_endpoint}/#{member_name}")).response
    Member.new(member.delete_if {|k, v| !column_names.include? k.to_sym})
  end

  # has_many :challenges
  def challenges
  end

  # has_many :recommendations
  def recommendations
  end

  # has_many :payments
  def payments
  end

end

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
