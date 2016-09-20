activate :directory_indexes
activate :autoprefixer

set :relative_links, true
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :layout, "layouts/application"
set :partials_dir, "partials"

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :development do
  activate :livereload
end

configure :build do
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

activate :blog do |blog|
  blog.name = "press"
  blog.prefix = "press"
  blog.permalink = "/{year}/{title}.html"
  blog.paginate = true
  blog.page_link = "page/{num}"
  blog.per_page = 10
end

activate :blog do |blog|
  blog.name = "installations"
  blog.prefix = "installations"
  blog.permalink = "/{year}/{title}.html"
  blog.paginate = true
  blog.page_link = "page/{num}"
  blog.per_page = 10
end

page "/press/*", :layout => "blog"
page "/installations/*", :layout => "blog"

helpers do
  def media_block(images)
    if images.is_a? Array
      partial "partials/media_block", :locals => { :media => images }
    elsif images.is_a? String
      partial "partials/media_block", :locals => { :media => [images] }
    else
      return false
    end
  end
end

