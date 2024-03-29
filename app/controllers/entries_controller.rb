# frozen_string_literal: true

# entries controller class for communicating between views and model
class EntriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_feed, only: :index

  def index
    @entries = @feed.entries.order('published desc')
  end

  def show
    @entry = Entry.find(params[:id]).decorate
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end
end
