class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
        @q = current_user.feed.ransack(microposts_search_params)
        @feed_items = @q.result.paginate(page: params[:page])
      else
        @q = Micropost.none.ransack
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
      @likes = Like.where(micropost_id: params[:micropost_id])
      @url = root_path
    end
  end
end
