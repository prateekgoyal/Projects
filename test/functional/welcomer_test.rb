require 'test_helper'

class WelcomerTest < ActionMailer::TestCase
  test "welcome" do
    mail = Welcomer.welcome(users(:one))
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Welcome", mail.body.encoded
  end

end
