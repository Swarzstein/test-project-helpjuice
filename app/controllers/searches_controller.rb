class SearchesController < ApplicationController
  before_action :require_user
  before_action :set_current_user

  def index
    # @searches = Search.where(user_id: @current_user.id)
    # @global_searches = Search.all
  end

  def create
    # @last_search = last_search
    # @search = Search.new(search_params)
    # if @last_search.nil? || @search.query.include?(@last_search.query) == false
    #   if @search.query != ""
    #     @search.user_id = @current_user.id	
    #     @search.save
    #     @last_search = @search
    #   end
    # else
    #   @last_search.query = @search.query
    #   @last_search.save
    # end
  end

  private

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
