class SearchesController < ApplicationController
  before_action :require_user
  before_action :set_current_user
  before_action :initial_search, only: [:index]

  def index
    @searches = Search.where(user_id: @current_user.id).order(created_at: :desc).limit(10)
  end

  def create
    @last_search = last_search
    @search = Search.new(search_params)
    if @last_search.nil? || @search.query.include?(@last_search.query) == false || @search.query == @last_search.query
      if @search.query != ""
        @search.user_id = @current_user.id	
        @search.save
      else
        @last_search = nil
      end
    else
      @last_search.query = @search.query
      @last_search.save
    end
    render json: { search: @search.query }
  end

  private

  def initial_search
    @last_search = nil
  end

  def set_current_user
    @current_user = current_user
  end

  def last_search
    @last_search ||= Search.where(user_id: @current_user.id).last
  end

  def search_params
    params.require(:search).permit(:query)
  end
end
