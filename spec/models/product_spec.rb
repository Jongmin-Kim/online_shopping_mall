require "spec_helper"
require "rails_helper"
require "product"


describe Product do 
  it 'is invalid without a name' do
    shirt = Product.new
    shirt.should_not be_valid
  end
end

