class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def terms_of_service
    @footer = Post.limit(3).order('created_at DESC')
    @footer2 = Post.limit(3).order("RANDOM()")
  end


  def privacy_policy
  	@footer = Post.limit(3).order('created_at DESC')
    @footer2 = Post.limit(3).order("RANDOM()")
  end
end
