class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
# add routes
  get '/' do 
    "Hello World"
  end

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
  #find one bakery using params
    bakery = Bakery.find(params[:id])
  # return as json
    bakery.to_json(include: :baked_goods)
  end
  
  get '/baked_goods/by_price' do
  # list all baked goods ordered by price
    goods = BakedGood.all.order(price: :desc)
  # return as json
    goods.to_json
  end

  get '/baked_goods/most_expensive' do 
    all_goods = BakedGood.all.order(price: :desc)
  #returns the most expensive aka the first on the desending order list 
    all_goods[0].to_json
  end

end
