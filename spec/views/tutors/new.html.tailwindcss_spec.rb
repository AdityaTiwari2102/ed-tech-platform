require 'rails_helper'

RSpec.describe 'tutors/new', type: :view do
  before(:each) do
    assign(:tutor, build(:tutor, course: create(:course)))
  end

  it 'renders new tutor form' do
    render

    assert_select 'form[action=?][method=?]', tutors_path, 'post' do

      assert_select 'input[name=?]', 'tutor[name]'

      assert_select 'input[name=?]', 'tutor[email]'

      assert_select 'select[name=?]', 'tutor[course_id]'
    end
  end
end
