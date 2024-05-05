require 'rails_helper'

RSpec.describe "tutors/show", type: :view do
  before(:each) do
    assign(:tutor, FactoryBot.create(:tutor, name: "HC Verma", email: "hc.verma@gmail.com", course: FactoryBot.create(:course)))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Course/)
  end
end
