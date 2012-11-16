class ChallengesController < ApplicationController
  def closed
    @challenges = Challenge.closed
  end

  def recent
    @challenges = Challenge.closed
  end

  def comments
  end

  def participants
  end

  def survey
  end

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def update
  end
end
