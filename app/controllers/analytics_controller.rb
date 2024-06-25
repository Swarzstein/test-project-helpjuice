class AnalyticsController < ApplicationController
  before_action :require_user
  before_action :set_current_user
  
  def index
    @top_searches = Search.where(user_id: current_user.id)
                          .where('created_at >= ?', 30.days.ago)
                          .group(:query)
                          .order(count_id: :desc)
                          .limit(5)
                          .count(:id)
    search = Search.where(user_id: current_user.id)
                    .where('created_at >= ?', 30.days.ago)
    search = search.where('query ILIKE ?', "%#{filter_params[:query]}%") if filter_params[:query].present?
    @filtered_searches = search.where('created_at >= ?', 30.days.ago)
                          .group(:query)
                          .order(count_id: :desc)
                          .limit(5)
                          .count(:id)

    @chart_data = @filtered_searches.map do |query, count|
      [query, count]
    end
  end

  private

  def set_current_user
    @current_user = current_user
  end

  def filter_params
    params.permit(:query)
  end
end
