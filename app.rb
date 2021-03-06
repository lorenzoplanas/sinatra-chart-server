# encoding: UTF-8
require 'sinatra/base'
require 'sinatra-charter'

class Charter < Sinatra::Base
  helpers Sinatra::Charter::Helpers
  set :env,                   :production
  set :app_file,              __FILE__
  set :root,                  File.dirname(__FILE__)
  set :public,                Proc.new { File.join(root, "public") }
  set :default_locale,        'en'
  enable                      :static, :show_exceptions

  post %r{^/chart/(\w+)\.json/?$} do 
    send_chart_url :from => 'json', :hide_title => true, :hide_legend => true, :right_margin => 0, :left_margin => 0, :marker_color => '#999', :marker_font_size => 16
  end 
  
  post %r{^/chart/(\w+)/?$} do 
    send_chart_url
  end
end
