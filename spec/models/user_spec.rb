require 'spec/spec_helper'

describe User do

  dataset :users
  
  describe '#generate_api_key' do
    it 'should assign the instance variables' do
      @form = forms(:checkout)
      @page = pages(:home)
      @order = shop_orders(:one_item)
    end
  end
  
end