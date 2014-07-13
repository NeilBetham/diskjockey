require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "confirmation" do
    mail = UserMailer.confirmation
    assert_equal "Confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "show_notfication" do
    mail = UserMailer.show_notfication
    assert_equal "Show notfication", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "sub_request" do
    mail = UserMailer.sub_request
    assert_equal "Sub request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
