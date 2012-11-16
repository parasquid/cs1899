class Member
  include ActiveModel::Model

  def self.attr_accessor(*vars)
    @column_names ||= []
    @column_names.concat( vars )
    super
  end

  def self.column_names
    @column_names
  end

  attr_accessor :id, :name, :profile_pic, :attributes,
    :challenges_entered, :active_challenges,
    :total_1st_place, :total_2nd_place, :total_3st_place,
    :total_wins, :total_public_money,
    :summary_bio

  API_ENDPOINT = APP_CONFIG[:cs_api][:members]

  def self.all
    Hashie::Mash.new(JSON.parse(RestClient.get APP_CONFIG[:cs_api][:members])).response.map do |member|
      Member.new(member.to_hash)
    end
  end

  def self.find(member_name)
    member = Hashie::Mash.new(JSON.parse(RestClient.get "#{APP_CONFIG[:cs_api][:members]}/#{member_name}")).response
    m = Member.new(member.to_hash.delete_if {|k, v| !column_names.include? k.to_sym})
  end

  def persisted?
    !!id
  end

  def to_param
    name
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
