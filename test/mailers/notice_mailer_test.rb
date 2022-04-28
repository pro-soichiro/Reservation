require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "alert" do
    mail = NoticeMailer.alert
    assert_equal "Alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
