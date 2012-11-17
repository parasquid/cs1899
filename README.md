# Deployment

Clone the repository

    git clone git://github.com/parasquid/cs1899.git
    cd cs1876

Edit the config.yml and specify your endpoints and how long the app will cache the api endpoint responses

Create your app on heroku

		heroku apps:create <my-app>

Setup the databases

		heroku addons:add heroku-postgresql:dev
		heroku run rake db:version
		heroku run rake db:migrate --trace
		heroku run rake db:seed
		heroku restart

Deploy to heroku

		git push heroku master

You can now use the application

		heroku open

A [sample](http://parasquid-cs1899.herokuapp.com/) application has already been setup. The login details are:

		username: admin
		email: admin@example.com
		password: madmin

# Technical Specifications

Most of the action happens in the class ApiModel (found in app/models). It exposes an ActiveRecord-like DSL that uses the CloudSpokes API as the data source. Many of the ActiveRecord conveniences like #has_many and #column_names have been implemented and slightly modified to adapt as painlessly as possile to the backing API resource.

Note that this is not a 100% completely compatible implementation of ActiveRecord. For example, #belongs_to is not implemented (yet) so there is not an easy way to request the parent object from a collection (e.g. you can easily call challenge.participants but you cannot call as of yet challenge.participants.first.challenge -- there is no linkage in the direction of child to parent). However, based on a quick usage estimate, there is rarely any reason to request a child independent (or without foreknowledge) of its parent and eventually needing to figure out the parent object, so it's not that much pf an issue.

Models descend from ApiModel, which in turn implements the ActiveModel from Rails 4.0 -- this means that along with ActiveRecord DSL capabilities, an ApiModel is also compatible with ActionPack. That also means you can use it with view helpers such as form_for or url_for, simplifying routes.

To create a new model, first inherit from ApiModel and then implement #api_endpoint. Implementing #api_endpoint is important because some relationships that are not in the JSON sent by the api need to be resolved via calling the api. The nodel name is, by convention should be the same as the url endpoint you will be calling to request it (e.g. Participant -> /participants).

You'll then need to list out the attributes (via #attr_accessor) the model should be exposing. We don't have support for typecasting yet, so you'll have to implement your own typecasts as an accessor. For example:

		attr_accessor :start_date

		def start_date
			Date.parse @start_date.to_s if @start_date
		end

Objects are actually a [Hashie::Mash](http://rdoc.info/github/intridea/hashie/Hashie/Mash) giving the ability to do dot-notation calls for the fields.

An example scaffolding has been setup to showcase how easy it is to use the models from a view/controller perspective -- it simply behaves just like any other ActiveRecord object that a Rails developer migth expect.

Not yet implemented (due to instructions of not going overboard :P -- but seriously, the sample api requires authentication to modify resources so I thought they're not in the scope of this challenge):

* Model#create
* Model#update
* Model#update_attributes
* Model#save

# Others

I love doing CloudSpokes challenges because it allows me to explore new things and work on interesting stuff in a directed fashion. Unguided research and playing around can sometimes be boring and can lead to procrastination, but if you have a goal to work for it becomes a great motivation to finish things :P With that, here are some things I've learned.

ActiveModel::Model was copied and pasted into app/models because [it will only be available in Rails 4.0](http://blog.plataformatec.com.br/2012/03/barebone-models-to-use-with-actionpack-in-rails-4-0/). If you're interested in implementing a model that is not backed by a database, and yet still responds just like any old ActiveRecord model, you should definitely look at ActiveModel.

I got exposed to RefineryCMS with this challenge. At first I thought it would be a pain to setup, but when I finally summoned the courage to attempt to install it, it was a snap just like that (it was kinda disappointing actually as I had psyched myself for a major debugging marathon). The [asset gem I used for quick bootstrap styling](https://github.com/ghoppe/refinerycms-bootstrap) also was a great resource for implementing my own asset gems.