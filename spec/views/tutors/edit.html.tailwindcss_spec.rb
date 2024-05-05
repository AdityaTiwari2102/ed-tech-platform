require 'rails_helper'

RSpec.describe "tutors/edit", type: :view do
  let(:tutor) {
    FactoryBot.create(:tutor, course: FactoryBot.create(:course))
  }

  before(:each) do
    assign(:tutor, tutor)
  end

  it "renders the edit tutor form" do
    render

    assert_select "form[action=?][method=?]", tutor_path(tutor), "post" do

      assert_select "input[name=?]", "tutor[name]"

      assert_select "input[name=?]", "tutor[email]"

      assert_select "select[name=?]", "tutor[course_id]"
    end
  end
end
