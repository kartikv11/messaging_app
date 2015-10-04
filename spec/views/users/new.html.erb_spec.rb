require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :email_id => "MyString",
      :is_active => false,
      :team_name => "MyString",
      :full_name => "MyString",
      :password => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_email_id[name=?]", "user[email_id]"

      assert_select "input#user_is_active[name=?]", "user[is_active]"

      assert_select "input#user_team_name[name=?]", "user[team_name]"

      assert_select "input#user_full_name[name=?]", "user[full_name]"

      assert_select "input#user_password[name=?]", "user[password]"
    end
  end
end
