require 'rails_helper'

RSpec.describe "killmails/new", type: :view do
  before(:each) do
    assign(:killmail, Killmail.new(
      :body => "MyText"
    ))
  end

  it "renders new killmail form" do
    render

    assert_select "form[action=?][method=?]", killmails_path, "post" do

      assert_select "textarea#killmail_body[name=?]", "killmail[body]"
    end
  end
end
