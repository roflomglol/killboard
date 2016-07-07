require 'rails_helper'

RSpec.describe "killmails/show", type: :view do
  before(:each) do
    @killmail = assign(:killmail, Killmail.create!(
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
