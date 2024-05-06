require 'rails_helper'

RSpec.describe 'courses/new', type: :view do
  before(:each) do
    assign(:course, build(:course))
  end

  it 'renders new course form' do
    render

    assert_select 'form[action=?][method=?]', courses_path, 'post' do

      assert_select 'input[name=?]', 'course[title]'

      assert_select 'input[name=?]', 'course[description]'

      assert_select 'input[name=?]', 'course[price]'

      assert_select 'select[name=?]', 'course[level]'

      assert_select 'select[name=?]', 'course[category]'

      assert_select 'select[name=?]', 'course[status]'
    end
  end
end
