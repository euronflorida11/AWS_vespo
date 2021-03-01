class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @sports = Sport.joins(:tags).where(tags: {name: params[:tag_name]})
  end
end