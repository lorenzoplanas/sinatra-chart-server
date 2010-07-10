# encoding: UTF-8
require 'sinatra'
require 'sinatra-charter'

class Charter < Sinatra::Base
  set :env,                   :production
  set :app_file,              __FILE__
  set :root,                  File.dirname(__FILE__)
  set :public,                Proc.new { File.join(root, "public") }
  set :default_locale,        'en'
  enable                      :static, :show_exceptions

  post %r{^/chart/(\w+)\.json/?$} do send_chart_url :from => 'json' end 
  post %r{^/chart/(\w+)/?$}       do send_chart_url end

end
