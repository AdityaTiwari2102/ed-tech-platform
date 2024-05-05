require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  let(:course) {
    FactoryBot.create(:course)
  }

  before(:each) do
    assign(:course, course)
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(course), "post" do

      assert_select "input[name=?]", "course[title]"

      assert_select "input[name=?]", "course[description]"

      assert_select "input[name=?]", "course[price]"

      assert_select "select[name=?]", "course[level]"

      assert_select "select[name=?]", "course[category]"

      assert_select "select[name=?]", "course[status]"
    end
  end
end
