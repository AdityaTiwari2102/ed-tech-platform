require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      create(:course, title: "Title1", description: "Description", price: 1000, level: "beginner", category: "web_development", status: "live"),
      create(:course, title: "Title2", description: "Description", price: 1000, level: "beginner", category: "web_development", status: "live")
  ])
  end

  it "renders a list of courses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title1"), count: 1
    assert_select cell_selector, text: Regexp.new("Title2"), count: 1
    assert_select cell_selector, text: Regexp.new("Description"), count: 2
    assert_select cell_selector, text: Regexp.new(1000.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("beginner".humanize), count: 2
    assert_select cell_selector, text: Regexp.new("web_development".humanize), count: 2
    assert_select cell_selector, text: Regexp.new("live".humanize), count: 2
  end
end
