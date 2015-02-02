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
set :site_description,      "We are people from different parts of the world to build technology for the world."
set :site_url_production,   "http://creativa77.github.io/ekumenlabs.com/"
set :site_url_development,  "http://localhost:4567/"
set :css_dir,               'css'
set :js_dir,                'js'
set :images_dir,            'img'
set :fonts_dir,             'fonts'
set :partials_dir,          '_partials'
set :relative_links,        true

# Sitemap XML
require "builder"
page "/sitemap.xml", :layout => false

# Slim template engine
# require "slim"

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

  # Gets partials from the _partials directory
  def _partial(partial_filename)
    partial "_partials/#{partial_filename}"
  end

  # Formats li item, and determines when to put class=active on li element
  # (according to Bootstrap >3.1.1 spec)
  def nav_li(label, url, css_class="", icon="")

    # Determine if icon is specified
    nav_icon = ""
    unless icon.nil? or icon.empty?
      nav_icon = " <i class='fa #{icon}'></i>"
    end

    # Normalize name string for use as HTML class
    li_classes = ""
    unless css_class.nil? or css_class.empty?
      # Assign processed name to variable
      li_classes = "#{css_class}"
    else
      label_formatted = label.downcase.tr(" ", "-")
      li_classes = "nav-item-#{label_formatted}"
    end

    if current_page.url == url
      li_classes += " active"
    end

    "<li class='#{li_classes}'><a href='#{url}'>#{label}#{nav_icon}</a></li>"
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
  activate :imageoptim do |options|
    # Image extensions to attempt to compress
    options.image_extensions = %w(.png .jpg .gif .svg)
    # Cause image_optim to be in shouty-mode
    options.verbose = false
  end

  # Create favicon and device-specific icons
  # Edit favicon_template.png for custom icon
  activate :favicon_maker, :icons => {
    "favicon_template.png" => [
      { icon: "apple-touch-icon-precomposed.png" },
      { icon: "favicon.ico", size: "32x32" }
    ]
  }
end
