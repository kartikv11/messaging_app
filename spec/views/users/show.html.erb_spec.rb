require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email_id => "Email",
      :is_active => false,
      :team_name => "Team Name",
      :full_name => "Full Name",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Team Name/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Password/)
  end
end
