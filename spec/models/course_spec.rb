require 'rails_helper'

RSpec.describe Course, type: :model do
  it "is valid with valid attributes" do
    expect(build(:course)).to be_valid
  end

  it "is valid without description" do
    expect(build(:course, description: nil)).to be_valid
  end

  it "is not valid without a title" do
    course = build(:course, title: nil)
    expect(course).to_not be_valid
  end

  it "is not valid with a description length of more than 100" do
    course = build(:course, description: "a" * 101)
    expect(course).to_not be_valid
  end

  it "is not valid without a price" do
    course = build(:course, price: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without a level" do
    course = build(:course, level: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without a category" do
    course = build(:course, category: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without a status" do
    course = build(:course, status: nil)
    expect(course).to_not be_valid
  end

  it "is not valid with a duplicate title" do
    create(:course, title: "Title")
    course = build(:course, title: "Title")
    expect(course).to_not be_valid
  end

  it "is not valid with a price less than 1000" do
    course = build(:course, price: 999)
    expect(course).to_not be_valid
  end

  it "is not valid with start date less than today" do
    course = build(:course, start_date: Date.yesterday)
    expect(course).to_not be_valid
  end

  it "is not valid with end date less than start date" do
    course = build(:course, end_date: Date.yesterday)
    expect(course).to_not be_valid
  end
end
