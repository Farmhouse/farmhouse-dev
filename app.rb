class App < Sinatra::Base
  get '/' do
    File.open('public/index.html')
  end

  get '/:directory' do
    path = "public/#{params[:directory]}/index.html"
    File.open(path) if File.exists?(path)
  end
end
