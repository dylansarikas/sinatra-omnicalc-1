require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/results") do
  @num = params["number"]
  @square = params["number"].to_f * params["number"].to_f
  erb(:square_results)
end

get("/square/new") do
  erb(:home)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do 
  @num = params["user_number"]
  @root = Math.sqrt(params["user_number"].to_f)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr_form = params["user_apr"].to_f.to_fs(:percentage, {:precision => 4})
  @apr = (((params["user_apr"].to_f) /100) /12)
  @years_form = params["user_years"]
  @years = (params["user_years"].to_i * 12)
  @principal_form = params["user_pv"].to_f.to_fs(:currency, {:precision => 2})
  @principal = params["user_pv"].to_f
  @numerator = @apr * @principal
  @denominator = 1 - ((1 + @apr) ** -@years)
  @payment = (@numerator / @denominator).to_fs(:currency, {:precision => 2})
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params["user_min"].to_f
  @max = params["user_max"].to_f
  @rando = rand(@min..@max)
  erb(:random_result)
end
