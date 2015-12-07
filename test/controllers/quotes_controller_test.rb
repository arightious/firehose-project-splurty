require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
    quote = Quote.create(:author => 'Franklin Roosevelt', :saying => 'A conservative is a man with two perfectly good legs who, however, has never learned how to walk forward.')
    get :show, :id => quote.id
    assert_response :success
  end

  test "quote show page, not found" do
    get :show, :id => 'OMG'
    assert_response :not_found
  end
end