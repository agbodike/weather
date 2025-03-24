require 'rails_helper'

RSpec.describe "weather/index.html.erb", type: :view do
  it "prompts the user to enter address" do
    render
    expect(rendered).to match(/Enter Street Address/)
  end
end
