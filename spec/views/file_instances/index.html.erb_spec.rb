require 'rails_helper'

RSpec.describe "file_instances/index", :type => :view do
  before(:each) do
    assign(:file_instances, [
      FileInstance.create!(
        :file_type => 1,
        :name => "Name",
        :description => "MyText",
        :user_id => 2
      ),
      FileInstance.create!(
        :file_type => 1,
        :name => "Name",
        :description => "MyText",
        :user_id => 2
      )
    ])
  end

  it "renders a list of file_instances" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
