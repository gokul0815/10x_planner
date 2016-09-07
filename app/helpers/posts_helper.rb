module PostsHelper
  def total_posts
    Post.count
  end
end
