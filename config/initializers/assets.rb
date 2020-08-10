# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( backoffice/fonts/floki.ttf )
Rails.application.config.assets.precompile += %w( backoffice/css/sb-admin.css )
Rails.application.config.assets.precompile += %w( backoffice/'js/sb-admin.js )

Rails.application.config.assets.precompile += %w( Victor/web/assets/mobirise-icons/mobirise-icons.css )
Rails.application.config.assets.precompile += %w( Victor/tether/tether.min.css )
Rails.application.config.assets.precompile += %w( Victor/dropdown/css/style.css )
Rails.application.config.assets.precompile += %w( Victor/socicon/css/styles.css )
Rails.application.config.assets.precompile += %w( Victor/theme/css/style.css )
Rails.application.config.assets.precompile += %w( Victor/mobirise/css/mbr-additional.css )

Rails.application.config.assets.precompile += %w( Victor/tether/tether.min.js )
Rails.application.config.assets.precompile += %w( Victor/smoothscroll/smooth-scroll.js )
Rails.application.config.assets.precompile += %w( Victor/dropdown/js/nav-dropdown.js )
Rails.application.config.assets.precompile += %w( Victor/dropdown/js/navbar-dropdown.js )
Rails.application.config.assets.precompile += %w( Victor/touchswipe/jquery.touch-swipe.min.js )
Rails.application.config.assets.precompile += %w( Victor/mbr-clients-slider/mbr-clients-slider.js )
Rails.application.config.assets.precompile += %w( Victor/sociallikes/social-likes.js )
Rails.application.config.assets.precompile += %w( Victor/theme/js/script.js )
Rails.application.config.assets.precompile += %w( Victor/formoid/formoid.min.js )

Rails.application.config.assets.precompile += %w( Victor/videos/autoplay.mp4 )
