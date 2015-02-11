# Deploy with middleman deploy
activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

# ========================================================================
# Site settings
# ========================================================================
set :site_title,            "Ekumen"
set :site_description,      "We are people from different parts of the planet to build technology for the world."
set :site_url_production,   "http://creativa77.github.io/ekumenlabs.com/"
set :site_url_development,  "http://localhost:4567/"
set :css_dir,               'css'
set :js_dir,                'js'
set :images_dir,            'img'
set :partials_dir,          '_partials'
set :relative_links,        true

# Sitemap XML
require "builder"
page "/sitemap.xml", :layout => false

# Allow HTML in the Markdown
# see https://github.com/middleman/middleman/issues/1221#issuecomment-38104894
# Note that Markdown formatting syntax is not processed within block-level HTML
# tags. E.g., you can’t use Markdown-style *emphasis* inside an HTML block.
# set :markdown, parse_block_html: true

# Internationalization
activate :i18n

# Use relative URLs
activate :relative_assets

# Pretty URLs
activate :directory_indexes

# Autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['> 5%', 'Explorer >= 9', 'Firefox >= 20']
  config.cascade  = false
  config.inline   = false
end

activate :blog do |blog|
  blog.name = "blog"
  blog.prefix = "blog"
  blog.layout = "blog_article"
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.paginate = true
  blog.page_link = "page:num"
  blog.per_page = 5
end

activate :blog do |blog|
  blog.name = "projects"
  blog.prefix = "projects"
  blog.tag_template = "projects_tag.html"
  blog.permalink = "{title}.html"
  blog.sources = "{title}.html"
  blog.layout = "project_detail"
end

# Reload the browser automatically whenever files change
activate :livereload

# ========================================================================
# Page options, layouts, aliases and proxies
# ========================================================================

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html",
# :locals => {:which_fake_page => "Rendering a fake page with a local
# variable" }

# ========================================================================
# Helpers
# ========================================================================

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  def nav_link_to(link, url, opts={})
    current_url = current_resource.url
    if current_url == url_for(url) || current_url == url_for(url) + "/" ||
      url_for(url).start_with?("./")
      prefix = '<li class="active">'
    else
      prefix = '<li>'
    end
    prefix + link_to(link, url, opts) + "</li>"
  end
end


# ========================================================================
# Development-specific configuration
# ========================================================================
configure :development do
  set :site_url, "#{site_url_development}"
end

# ========================================================================
# Build-specific configuration
# ========================================================================
configure :build do
  set :site_url, "#{site_url_production}"
  set :sass, line_comments: false, style: :expanded

  # Enable cache buster
  # activate :asset_hash, :exts => ['.css', '.png', '.jpg', '.gif']

  # Ignore files/dir during build process
  ignore "favicon_template.png"
  ignore "sitemap.yml"

  # Compress and optimise images during build
  # Documentation: https://github.com/plasticine/middleman-imageoptim
  # activate :imageoptim do |options|
  #   # Image extensions to attempt to compress
  #   options.image_extensions = %w(.png .jpg .gif .svg)
  #   # Cause image_optim to be in shouty-mode
  #   options.verbose = false
  # end

  # Create favicon and device-specific icons
  # Edit favicon_template.png for custom icon
  # activate :favicon_maker, :icons => {
  #   "favicon_template.png" => [
  #     { icon: "apple-touch-icon-precomposed.png", size: "152x152"  },
  #     { icon: "favicon.ico", size: "32x32" }
  #   ]
  # }
end
