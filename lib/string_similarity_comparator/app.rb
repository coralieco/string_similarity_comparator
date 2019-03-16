require 'sinatra'
require "sinatra/namespace"
require 'sinatra/flash'
require_relative '../string_similarity_comparator/pool'

module StringSimilarityComparator
  class App < Sinatra::Base
    register Sinatra::Namespace
    enable :sessions
    register Sinatra::Flash
    set :views, (proc { File.join(root, "views") })

    error 404 do
      erb :"404"
    end

    get '/' do
      string_a = params['string_a']
      string_b = params['string_b']

      if string_a && string_b
        redirect to("/string_similarity?string_a=#{string_a}&string_b=#{string_b}")
      else
        erb :welcome
      end
    end

    namespace '/api/v1' do
      before do
        content_type 'application/json'
      end

      get '/string_similarity' do
        string_a = params['string_a']
        string_b = params['string_b']

        if (string_a.nil? || string_a.strip.empty?) || (string_b.nil? || string_b.strip.empty?)
          flash[:warning] = "Strings can not be blank!"
          redirect to('/')
        else
          @ssc = StringSimilarityComparator::Pool.new(string_a, string_b).calculate
        end

        erb :string_similarity
      end
    end
  end
end

StringSimilarityComparator::App.run!
