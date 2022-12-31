class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: { baked_goods: { only: [:name, :price] } })
  end

  get '/baked_goods/by_price' do
    bakeries = BakedGood.order('price DESC')
    bakeries.to_json
  end

  get '/baked_goods/most_expensive' do
    bakeries = BakedGood.order('price ASC').last
    bakeries.to_json
  end

end
