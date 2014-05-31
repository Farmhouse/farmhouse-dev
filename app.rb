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

    def google_map(options)
      "//maps.googleapis.com/maps/api/staticmap?#{options}"
    end
  end


  before do
    expires 3600, :public, :must_revalidate
  end


  get '/' do
    @title = 'The Farmhouse in Hollywood, California'

    erb :index
  end


  get '/about' do
    @title = 'The Farmhouse: A Very Brief and Incomplete History'
    @header = 'light'

    @friends = [
      {'name' => 'Shane Becker', 'image' => 'shane-becker.jpg', 'twitter' => 'veganstraightedge', 'instagram' => 'veganstraightedge'},
      {'name' => 'Heather Peterson', 'image' => 'heather-peterson.jpg', 'twitter' => 'hrrrthrrr', 'instagram' => 'hrrrthrrr'},
      {'name' => 'TJ Nelson Jr', 'image' => 'tj-nelson.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Kristen Reyes', 'image' => 'kristen-reyes.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Civ', 'image' => 'civ.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Evan Phoenix', 'image' => 'evan-phoenix.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Anneke Hiatt', 'image' => 'anneke-hiatt.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Bookis Smuin', 'image' => 'bookis-smuin.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'John Bender', 'image' => 'john-bender.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Brooke Graham', 'image' => 'brooke-graham.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Eli Duke', 'image' => 'eli-duke.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Mates of State', 'image' => 'mates-of-state.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Blue Ribbon Glee Club', 'image' => 'blue-ribbon-glee-club.jpg', 'twitter' => '', 'instagram' => ''},
      {'name' => 'Bramble', 'image' => 'bramble.jpg', 'twitter' => '', 'instagram' => ''}
    ]

    erb :about
  end


  get '/blog' do
    @title = "The Farmhouse: News and Ponderings"

    erb :blog
  end


  get '/contact' do
    @header = 'light'

    # https://developers.google.com/maps/documentation/staticmaps/
    map = {
      'address' => "1558+Gordon+Street,Los+Angeles,CA",
      'zoom' => "14",
      'size' => "640x640",
      'scale' => "2",
      'markers' => "color:red%7C1558+Gordon+Street,Los+Angeles,CA"
    }

    @map_options = "center=#{map['address']}&zoom=#{map['zoom']}&scale=#{map['scale']}&size=#{map['size']}&markers=#{map['markers']}"

    erb :contact
  end

  get '/projects' do
     erb :projects
  end

end
