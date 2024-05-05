require 'rails_helper'

RSpec.describe "tutors/index", type: :view do
  before(:each) do
    assign(:tutors, [
      FactoryBot.create(:tutor, name: "Name", email: "tutor1@example.com", course: FactoryBot.create(:course)),
      FactoryBot.create(:tutor, name: "Name", email: "tutor2@example.com", course: FactoryBot.create(:course))
    ])
  end

  it "renders a list of tutors" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("tutor1@example.com".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("tutor2@example.com".to_s), count: 1
  end
end
