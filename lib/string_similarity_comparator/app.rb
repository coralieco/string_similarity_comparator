require 'sinatra'
require_relative '../string_similarity_comparator/pool'

module StringSimilarityComparator
  class App < Sinatra::Base
    set :views, (proc { File.join(root, "views") })

    before do
      content_type 'application/json'
    end

    get '/' do
      erb :welcome
    end

    error 404 do
      erb :"404"
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

StringSimilarityComparator::App.run!
