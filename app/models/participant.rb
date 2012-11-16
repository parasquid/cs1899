class Participant < ApiModel
  def self.api_endpoint
    raise 'we don\'t have an endpoint because we are depending on challenge'
  end

  attr_accessor :id, :attributes, :has_submission, :member, :status, :challenge

  # Cleanup up the __r convention
  def initialize(params={})
    params['member'] = params.delete('member__r')
    super(params)
  end

  # has_one :member
  # Note that we're not using the member data in the json because it
  # lacks many attributes. We simply just do another api call
  def member
    Member.find(@member.name)
  end

end

# http://cs-api-sandbox.herokuapp.com/v1/challenges/8/participants

# {
#     "response": [
#         {
#             "attributes": {
#                 "type": "Challenge_Participant__c",
#                 "url": "/services/data/v22.0/sobjects/Challenge_Participant__c/a0AJ0000004HuN4MAK"
#             },
#             "has_submission": false,
#             "member__r": {
#                 "attributes": {
#                     "type": "Member__c",
#                     "url": "/services/data/v22.0/sobjects/Member__c/a0IJ0000000d0r8MAA"
#                 },
#                 "name": "jeffdonthemic",
#                 "id": "a0IJ0000000d0r8MAA",
#                 "summary_bio": "This is my summary!!!",
#                 "total_wins": 0,
#                 "profile_pic": "http://cloudspokes.s3.amazonaws.com/Cloud_th_100.jpg"
#             },
#             "member": "a0IJ0000000d0r8MAA",
#             "id": "a0AJ0000004HuN4MAK",
#             "status": "Registered",
#             "challenge": "a0GJ0000006VS5LMAW"
#         },
#         {
#             "attributes": {
#                 "type": "Challenge_Participant__c",
#                 "url": "/services/data/v22.0/sobjects/Challenge_Participant__c/a0AJ0000004HuN8MAK"
#             },
#             "has_submission": false,
#             "member__r": {
#                 "attributes": {
#                     "type": "Member__c",
#                     "url": "/services/data/v22.0/sobjects/Member__c/a0IJ0000000d0rAMAQ"
#                 },
#                 "name": "mess",
#                 "id": "a0IJ0000000d0rAMAQ",
#                 "total_wins": 0,
#                 "profile_pic": "http://cloudspokes.s3.amazonaws.com/Cloud_th_100.jpg"
#             },
#             "member": "a0IJ0000000d0rAMAQ",
#             "id": "a0AJ0000004HuN8MAK",
#             "status": "Registered",
#             "challenge": "a0GJ0000006VS5LMAW"
#         }
#     ],
#     "count": 2
# }