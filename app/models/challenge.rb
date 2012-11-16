class Challenge < ApiModel
  attr_accessor :id

  def self.api_endpoint
    APP_CONFIG[:cs_api][:challenges]
  end

  # def self.find(entity)
  #   Member.new(raw_get entity)
  # end

  def to_param
    challenge_id
  end

end

# http://cs-api-sandbox.herokuapp.com/v1/members/jeffdonthemic/challenges

# {
#     "attributes": {
#         "type": "Challenge__c",
#         "url": "/services/data/v22.0/sobjects/Challenge__c/a0GJ0000006VS5LMAW"
#     },
#     "prize_type": "Currency",
#     "total_prize_money": 22424,
#     "end_date": "2013-04-17T18:02:00.000+0000",
#     "challenge_categories__r": {
#         "totalsize": 2,
#         "done": true,
#         "records": [
#             {
#                 "attributes": {
#                     "type": "Challenge_Category__c",
#                     "url": "/services/data/v22.0/sobjects/Challenge_Category__c/a08J0000002b4CEIAY"
#                 },
#                 "category__r": {
#                     "attributes": {
#                         "type": "Category__c",
#                         "url": "/services/data/v22.0/sobjects/Category__c/a07J00000038esMIAQ"
#                     },
#                     "name": "Java",
#                     "color": "000000",
#                     "id": "a07J00000038esMIAQ"
#                 },
#                 "category": "a07J00000038esMIAQ",
#                 "id": "a08J0000002b4CEIAY",
#                 "challenge": "a0GJ0000006VS5LMAW"
#             },
#             {
#                 "attributes": {
#                     "type": "Challenge_Category__c",
#                     "url": "/services/data/v22.0/sobjects/Challenge_Category__c/a08J0000002b4CFIAY"
#                 },
#                 "category__r": {
#                     "attributes": {
#                         "type": "Category__c",
#                         "url": "/services/data/v22.0/sobjects/Category__c/a07J00000038esJIAQ"
#                     },
#                     "name": "Heroku",
#                     "color": "000000",
#                     "id": "a07J00000038esJIAQ"
#                 },
#                 "category": "a07J00000038esJIAQ",
#                 "id": "a08J0000002b4CFIAY",
#                 "challenge": "a0GJ0000006VS5LMAW"
#             }
#         ]
#     },
#     "name": "RSpec Challenge",
#     "top_prize": "1000",
#     "challenge_id": "8",
#     "challenge_type": "Code",
#     "id": "a0GJ0000006VS5LMAW",
#     "start_date": "2012-03-17T18:02:00.000+0000",
#     "description": "sample Description",
#     "status": "Created",
#     "challenge_participants__r": {
#         "totalsize": 1,
#         "done": true,
#         "records": [
#             {
#                 "attributes": {
#                     "type": "Challenge_Participant__c",
#                     "url": "/services/data/v22.0/sobjects/Challenge_Participant__c/a0AJ0000004HuN4MAK"
#                 },
#                 "has_submission": false,
#                 "money_awarded": 0.0,
#                 "score": 0,
#                 "member": "a0IJ0000000d0r8MAA",
#                 "id": "a0AJ0000004HuN4MAK",
#                 "status": "Registered",
#                 "challenge": "a0GJ0000006VS5LMAW"
#             }
#         ]
#     }
# },
