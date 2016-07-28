require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "composed_of Hash assignment error" do
    user = User.new
    
    # *** ArgumentError Exception: wrong number of arguments (given 3, expected 1)
    assert_raises ArgumentError do
      user.preferences = user.preferences.to_hash.merge({ newsletters: false }) 
    end
  end
end
