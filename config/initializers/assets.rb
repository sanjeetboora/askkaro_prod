# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w(*.js)
Rails.application.config.assets.precompile += %w( loginsignup.css )
Rails.application.config.assets.precompile += %w( loginsignup.js )

Rails.application.config.assets.precompile += %w( navbar.css )
Rails.application.config.assets.precompile += %w( navbar.js )

Rails.application.config.assets.precompile += %w( profilepage.css )
Rails.application.config.assets.precompile += %w( profilepage.js )
# Precompile additional assets.

Rails.application.config.assets.precompile += %w( questionlist.css )
Rails.application.config.assets.precompile += %w( questionlist.js )
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( ckeditor/*)
