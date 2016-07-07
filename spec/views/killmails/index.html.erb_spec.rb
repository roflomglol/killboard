require 'rails_helper'

RSpec.describe "killmails/index", type: :view do
  before(:each) do
    assign(:killmails, [
      Killmail.create!(
        :body => "MyText"
      ),
      Killmail.create!(
        :body => "MyText"
      )
    ])
  end

  it "renders a list of killmails" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
