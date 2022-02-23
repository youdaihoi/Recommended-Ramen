class HomesController < ApplicationController
  def top
    @today_ramen_ranks = Ramen.find(Favorite.group(:ramen_id).where(created_at: Time.current.all_day).order('count(ramen_id) desc').limit(3).pluck(:ramen_id))
    @week_ramen_ranks = Ramen.find(Favorite.group(:ramen_id).where(created_at: Time.current.all_week).order('count(ramen_id) desc').limit(3).pluck(:ramen_id))
    @month_ramen_ranks = Ramen.find(Favorite.group(:ramen_id).where(created_at: Time.current.all_month).order('count(ramen_id) desc').limit(3).pluck(:ramen_id))
  end
end
