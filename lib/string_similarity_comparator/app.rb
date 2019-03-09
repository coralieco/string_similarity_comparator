require 'sinatra'
require_relative '../string_similarity_comparator/pool'

set :views, (proc { File.join(root, "app/views") })

get '/' do
  erb :welcome
end

error 404 do
  "Params are invalid"
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

puts "Hello, you're running your web app from a gem!"
