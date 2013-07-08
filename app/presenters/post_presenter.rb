class PostPresenter

  include ActionView::Helpers::DateHelper

  attr_reader :post, :index

  def initialize(post, index)
    @post = post
    @index = index
  end

  def featured
    "featured" if index == true
  end

  def header
    "#{post.title} - #{post.source}"
  end

  def published
    "Published #{ time_ago_in_words(post.posted_at) } ago."
  end

  def image
    index == true ? post.images[:large] : post.images[:small]
  end

  def description
    index == true ? post.description.truncate(160) : post.description.truncate(90)
  end

  def comment_count
    "#{post.comments.count} comments."
  end

  def related_posts
    post.related_posts.map do |post|
      {:title => post.title, :url => post.url, :source => post.source}
    end
  end

end