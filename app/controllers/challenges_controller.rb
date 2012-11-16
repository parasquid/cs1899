class ChallengesController < ApplicationController
  def closed
  end

  def recent
  end

  def comments
  end

  def participants
  end

  def survey
  end

  def index
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def update
  end
end
