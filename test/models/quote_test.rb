require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test "unique_tag" do
    quote = Quote.create(:author => 'Franklin Roosevelt', :saying => 'A conservative is a man with two perfectly good legs who, however, has never learned how to walk forward.')
    expected = 'FR#' + quote.id.to_s
    actual = quote.unique_tag
    assert_equal expected, actual
  end

end
