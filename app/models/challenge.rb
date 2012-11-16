class Challenge < ApiModel
  attr_accessor :id, :challenge_id, :challenge_type, :attributes,
    :prize_type, :total_prize_money, :top_prize,
    :start_date, :end_date,
    :name, :description, :status,
    :categories, :participants, :comments, :status

  # Cleanup up the __r convention
  def initialize(params={})
    params['categories'] = params.delete('challenge_categories__r')
    params['participants'] = params.delete('challenge_participants__r')
    super(params)
  end

  def self.api_endpoint
    APP_CONFIG[:cs_api][:challenges]
  end

  # Used for resourceful routes (instead of id)
  def to_param
    challenge_id
  end

  # Returns all the closed challenges
  def self.closed
    raw_get('closed').map {|challenge| Challenge.new challenge}
  end

  # Returns all the recent challenges
  def self.recent
    raw_get('recent').map {|challenge| Challenge.new challenge}
  end

  # Return an object instead of a string
  def start_date
    Date.parse(@start_date)
  end

  # Return an object instead of a string
  def end_date
    Date.parse(@end_date)
  end

  # TODO: blow up the categories into something useful
  def categories
    @categories
  end

  # has_many :comments
  # Note that the json does not expose this method
  def comments
    self.class.raw_get([challenge_id, 'comments'].join('/')).map do |comment|
      Comment.new comment
    end
  end

  # has_many :participants
  # Note that we're not using the participants data in the json because it
  # lacks many attributes. We simply just do another api call
  def participants
    self.class.raw_get([challenge_id, 'participants'].join('/')).map do |participant|
      Participant.new participant
    end
  end

  # has_one :status
  # TODO (this requires authemtication)
  def status
    ''
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
