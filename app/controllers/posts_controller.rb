class PostsController < ApplicationController

  def index
    @posts = []
    Post.all.each_with_index do |post, index|
      @posts << PostPresenter.new(post, index == 0)
    end
    @posts
  end

end