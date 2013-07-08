class PostPresenter < Mustache

  include ActionView::Helpers::DateHelper

  self.template_file = File.join(Rails.root, "app/views/posts/_post.html.mustache")

  attr_reader :post, :featured

  def initialize(post, true_false)
    @post = post
    @featured = true_false
  end

  def featured_post?
    " featured" if featured
  end

  def header
    "#{post.title} - #{post.source}"
  end

  def published
    "Published #{ time_ago_in_words(post.posted_at) } ago."
  end

  def image_file
    featured ? post.images[:large] : post.images[:small]
  end

  def description
    featured ? post.description.truncate(160) : post.description.truncate(90)
  end

  def comment_count
    "#{post.comments.count} comments."
  end

  def related_posts
    post.related_posts.map do |post|
      {title: post.title, url: post.url, source: post.source}
    end
  end

end