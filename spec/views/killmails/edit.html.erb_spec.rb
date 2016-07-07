require 'rails_helper'

RSpec.describe "killmails/edit", type: :view do
  before(:each) do
    @killmail = assign(:killmail, Killmail.create!(
      :body => "MyText"
    ))
  end

  it "renders the edit killmail form" do
    render

    assert_select "form[action=?][method=?]", killmail_path(@killmail), "post" do

      assert_select "textarea#killmail_body[name=?]", "killmail[body]"
    end
  end
end
