# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://thinkindianitr.club"

SitemapGenerator::Sitemap.create do
  add root_path, :priority => 0.7, :changefreq => 'monthly'
  add news_and_events_path, :priority => 0.7, :changefreq => 'daily'
  add about_path, :priority => 0.7, :changefreq => 'monthly'
  add new_contact_path, :priority => 0.7, :changefreq => 'monthly'

  PressRelease.all.each do |press|
    add press_release_path(press), :lastmod => press.updated_at
  end

  Thredded::Topic.all.each do |topic|
    add "/forum/#{topic.messageboard.slug}/#{topic.slug}", :lastmod => topic.updated_at
  end

  Post.all.each do |post|
    add post_path(post), :lastmod => post.updated_at
  end
end
