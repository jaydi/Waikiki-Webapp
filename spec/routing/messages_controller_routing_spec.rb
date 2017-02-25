require 'rails_helper'

describe MessagesController do
  it { expect(get: '/messages').to route_to(controller: 'messages', action: 'index') }
  it { expect(get: '/messages/1').to route_to(controller: 'messages', action: 'show', id: '1') }
  it { expect(post: '/messages/1/reply').to route_to(controller: 'messages', action: 'reply', id: '1') }
end