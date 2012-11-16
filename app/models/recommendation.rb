class Recommendation < ApiModel
  attr_accessor :id, :attributes,
  :recommendation, :createddate, :from

  def self.api_endpoint
    APP_CONFIG[:cs_api][:members]
  end

  # Cleanup up the __r convention
  def initialize(params={})
    params['from'] = params.delete('recommendation_from__r')
    super(params)
  end

  def createddate
    Date.parse(@createddate) if @createddate
  end

  # has_one :member
  # Note that we're not using the member data in the json because it
  # lacks many attributes. We simply just do another api call
  def member
    Member.find @from.name
  end

end

# http://cs-api-sandbox.herokuapp.com/v1/members/jeffdonthemic/recommendations

# {
#     "attributes": {
#         "type": "Recommendation__c",
#         "url": "/services/data/v22.0/sobjects/Recommendation__c/a0QJ0000000ORWsMAO"
#     },
#     "member": "a0IJ0000000d0r8MAA",
#     "recommendation": "my comment",
#     "createddate": "2012-10-12T12:57:14.000+0000",
#     "id": "a0QJ0000000ORWsMAO",
#     "recommendation_from": "a0IJ0000000d0rAMAQ",
#     "recommendation_from__r": {
#         "attributes": {
#             "type": "Member__c",
#             "url": "/services/data/v22.0/sobjects/Member__c/a0IJ0000000d0rAMAQ"
#         },
#         "name": "mess",
#         "id": "a0IJ0000000d0rAMAQ",
#         "profile_pic": "http://cloudspokes.s3.amazonaws.com/Cloud_th_100.jpg"
#     }
# },