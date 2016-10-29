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

ignore "press/template.html"
ignore "installations/template.html"

data.press.each_with_index do |item, index|
  proxy "/press/#{index}.html", "/press/template.html",
        locals: { entry: item }, ignore: true
end

data.installations.each_with_index do |item, index|
  proxy "/installations/#{index}.html", "/installations/template.html",
        locals: { entry: item }, ignore: true
end

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

