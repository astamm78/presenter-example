class PostsController < ApplicationController

  def index
    @presenters = []
    Post.all.each_with_index do |post, index|
      @presenters << PostPresenter.new(post, index == 0)
    end
    @presenters
  end

end