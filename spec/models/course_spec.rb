require 'rails_helper'

RSpec.describe Course, type: :model do
  it "is valid with valid attributes" do
    expect(FactoryBot.build(:course)).to be_valid
  end

  it "is valid without description" do
    expect(FactoryBot.build(:course, description: nil)).to be_valid
  end

  it "is not valid without a title" do
    course = FactoryBot.build(:course, title: nil)
    expect(course).to_not be_valid
  end

  it "is not valid with a description length of more than 100" do
    course = FactoryBot.build(:course, description: "a" * 101)
    expect(course).to_not be_valid
  end

  it "is not valid without a price" do
    course = FactoryBot.build(:course, price: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without a level" do
    course = FactoryBot.build(:course, level: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without a category" do
    course = FactoryBot.build(:course, category: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without a status" do
    course = FactoryBot.build(:course, status: nil)
    expect(course).to_not be_valid
  end

  it "is not valid with a duplicate title" do
    FactoryBot.create(:course, title: "Title")
    course = FactoryBot.build(:course, title: "Title")
    expect(course).to_not be_valid
  end

  it "is not valid with a price less than 1000" do
    course = FactoryBot.build(:course, price: 999)
    expect(course).to_not be_valid
  end

  it "is not valid with start date less than today" do
    course = FactoryBot.build(:course, start_date: Date.yesterday)
    expect(course).to_not be_valid
  end

  it "is not valid with end date less than start date" do
    course = FactoryBot.build(:course, end_date: Date.yesterday)
    expect(course).to_not be_valid
  end
end
