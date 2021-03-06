FactoryGirl.define do
  factory :message do
    sender { FactoryGirl.create(:user) }
    receiver { FactoryGirl.create(:partner) }
    text 'message text'
    kind 10
  end
  factory :reply_message, class: Message, parent: :message do
    sender { FactoryGirl.create(:partner) }
    receiver { FactoryGirl.create(:user) }
    initial_message { FactoryGirl.create(:message, sender: receiver, receiver: sender, status: :delivered) }
    video_url 'video url'
    kind 20
  end
end