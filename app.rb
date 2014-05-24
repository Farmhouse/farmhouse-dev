class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, File.dirname(__FILE__) + '/public'

  # This gets sass working with AssetPack
  set :scss, { :load_paths => [ "#{App.root}/assets/stylesheets/" ] }

  register Sinatra::AssetPack

  assets do
    serve '/images', :from => 'assets/images'
    serve '/js',     :from => 'assets/javascripts'
    serve '/css',    :from => 'assets/stylesheets'
    serve '/fonts',  :from => 'assets/fonts'

    # Add javascripts here to be concatenated into application.js
    js :application, [
      '/js/vendor/jquery.waitforimages.min.js',
      '/js/vendor/responsive-nav.min.js',
      '/js/vendor/waypoints.min.js',
      '/js/vendor/jquery.scrolly.js',
      '/js/stayput.js',
      '/js/scripts.js'
    ]

    # Add stylesheets here to be concateneated into application.css
    css :application, [
      '/css/application.css',
    ]

    js_compression :jsmin
    css_compression :sass
  end

  helpers do
    def current_year
      Time.now.year
    end
  end


  before do
    expires 3600, :public, :must_revalidate
  end

  get '/' do
    erb :index
  end

  get '/about' do
    erb :about
  end

  get '/blog' do
    erb :blog
  end
end
