require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        conversation: nil
      ),
      Message.create!(
        conversation: nil
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
