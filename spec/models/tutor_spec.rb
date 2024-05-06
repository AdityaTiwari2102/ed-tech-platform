require 'rails_helper'

RSpec.describe Tutor, type: :model do
  let(:course) { create(:course) }

  it 'is valid with valid attributes' do
    expect(build(:tutor, course: course)).to be_valid
  end

  it 'is not valid without a name' do
    tutor = build(:tutor, name: nil)
    expect(tutor).to_not be_valid
  end

  it 'is not valid without an email' do
    tutor = build(:tutor, email: nil)
    expect(tutor).to_not be_valid
  end

  it 'is not valid without a course' do
    tutor = build(:tutor, course: nil)
    expect(tutor).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    create(:tutor, email: 'email@example.com', course: course)
    tutor = build(:tutor, email: 'email@example.com', course: course)
    expect(tutor).to_not be_valid
  end
end
