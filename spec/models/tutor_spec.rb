require 'rails_helper'

RSpec.describe Tutor, type: :model do
  let(:course) { FactoryBot.create(:course) }

  it "is valid with valid attributes" do
    expect(FactoryBot.build(:tutor, course: course)).to be_valid
  end

  it "is not valid without a name" do
    tutor = FactoryBot.build(:tutor, name: nil)
    expect(tutor).to_not be_valid
  end

  it "is not valid without an email" do
    tutor = FactoryBot.build(:tutor, email: nil)
    expect(tutor).to_not be_valid
  end

  it "is not valid without a course" do
    tutor = FactoryBot.build(:tutor, course: nil)
    expect(tutor).to_not be_valid
  end

  it "is not valid with a duplicate email" do
    FactoryBot.create(:tutor, email: "email@example.com", course: course)
    tutor = FactoryBot.build(:tutor, email: "email@example.com", course: course)
    expect(tutor).to_not be_valid
  end
end
