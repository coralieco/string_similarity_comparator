require 'sinatra'
require "sinatra/namespace"
require_relative '../string_similarity_comparator/pool'

module StringSimilarityComparator
  class App < Sinatra::Base
    register Sinatra::Namespace

    set :views, (proc { File.join(root, "views") })

    get '/' do
      erb :welcome
    end

    error 404 do
      erb :"404"
    end

    namespace '/api/v1' do

      before do
        content_type 'application/json'
      end

      get '/string_similarity' do
        string_a = params['string_a']
        string_b = params['string_b']

        if string_a && string_b
          @ssc = StringSimilarityComparator::Pool.new(string_a, string_b).calculate
        else
          404
          redirect to('/')
        end

        erb :string_similarity
      end
    end
  end
end

StringSimilarityComparator::App.run!
