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

# Custom String#to_slug method for better URLs
String.class_eval do
  def to_slug
    value = mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s
    value.gsub!(/[']+/, '')
    value.gsub!(/\W+/, ' ')
    value.strip!
    value.downcase!
    value.gsub!(' ', '-')
    value
  end
end

data.press.each_with_index do |item|
  proxy "/press/#{item.title.to_slug}.html",
        '/press/template.html',
        locals: { entry: item },
        ignore: true
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

