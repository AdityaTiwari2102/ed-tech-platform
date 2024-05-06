require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do
  describe '#index' do
    let(:course) { create(:course, title: 'API Course', description: 'Testing for first course!') }
    let!(:tutor1) { create(:tutor, name: 'Sharma Ji', email: 'sharma@example.com', course: course) }
    let!(:tutor2) { create(:tutor, name: 'Gupta Ji', email: 'gupta@example.com', course: course) }

    context 'when valid params are passed' do
      let(:params) do
        {
          page: 1,
          per_page: 20
        }
      end

      it 'should list courses with associated tutors' do
        get :index, params: params
        response_json = JSON.parse(response.body).with_indifferent_access
        expect(response_json.dig('data', 0, 'title')).to eql(course.title)
        expect(response_json.dig('data', 0, 'description')).to eq(course.description)
        expect(response_json.dig('data', 0, 'price')).to eq(course.price)
        expect(response_json.dig('data', 0, 'start_date').to_date).to eq(course.start_date)
        expect(response_json.dig('data', 0, 'end_date').to_date).to eq(course.end_date)
        expect(response_json.dig('data', 0, 'category')).to eq(course.category)
        expect(response_json.dig('data', 0, 'level')).to eq(course.level)
        expect(response_json.dig('data', 0, 'status')).to eq(course.status)
        expect(response_json.dig('data', 0, 'tutors').count).to eq(2)
        expect(response_json.dig('data', 0, 'tutors', 0, 'name')).to eq(tutor1.name)
        expect(response_json.dig('data', 0, 'tutors', 0, 'email')).to eq(tutor1.email)
        expect(response_json.dig('data', 0, 'tutors', 1, 'name')).to eq(tutor2.name)
        expect(response_json.dig('data', 0, 'tutors', 1, 'email')).to eq(tutor2.email)
        expect(response_json.dig('metadata', 'page')).to eq(params[:page])
        expect(response_json.dig('metadata', 'per_page')).to eq(params[:per_page])
        expect(response_json.dig('metadata', 'total_entries')).to eq(1)
      end
    end

    context 'when invalid page params are passed' do
      let(:params) do
        {
          page: 'hi',
          per_page: 20
        }
      end

      it 'should respond with an invalid page error' do
        get :index, params: params
        response_json = JSON.parse(response.body)
        expect(response_json['success']).to eq(false)
        expect(response_json['message']).to eq('Invalid page.')
      end
    end

    context 'when invalid page params are passed' do
      let(:params) do
        {
          page: 1,
          per_page: 'hey there!'
        }
      end

      it 'should respond with an invalid per_page error' do
        get :index, params: params
        response_json = JSON.parse(response.body)
        expect(response_json['success']).to eq(false)
        expect(response_json['message']).to eq('Invalid per page.')
      end
    end
  end

  describe '#create' do
    before do
      post :create, params: params
    end

    context 'when valid' do
      let(:params) do
        {
          course: build(:course).attributes.except('id', 'created_at', 'updated_at').merge(tutors_attributes: [build(:tutor).attributes.except('id', 'created_at', 'updated_at')])
        }
      end

      it 'should create course' do
        expect(Course.count).to eq(1)
      end

      it 'should create tutors' do
        expect(Tutor.count).to eq(1)
      end

      it 'should respond with success' do
        expect(response.status).to eq(201)
      end
    end

    context 'when invalid' do
      context 'course title is blank' do
        let(:params) do
          {
            course: {
              title: nil,
              description: 'Some description' * 10,
              price: 100,
              start_date: Date.yesterday,
              end_date: Date.tomorrow
            }
          }
        end

        it 'should respond with 422 - Unprocessible Entity' do
          expect(response.status).to eq(422)
        end

        it 'it should return an error message' do
          response_json = JSON.parse(response.body)
          expect(response_json['message']).to eq(["Title can't be blank",
                                                  'Price must be greater than or equal to 1000',
                                                  "Start date must be greater than or equal to #{Date.today.strftime('%Y-%m-%d')}",
                                                  'Description is too long (maximum is 100 characters)'])
        end

      end

      context 'when tutor name and email is blank' do
        let(:params) do
          {
            course: build(:course).attributes.except('id', 'created_at', 'updated_at').merge(tutors_attributes: [{ name: nil, email: nil }])
          }
        end

        it 'should respond with 422 - Unprocessible Entity' do
          expect(response.status).to eq(422)
        end

        it 'should have error in response body' do
          response_json = JSON.parse(response.body)
          expect(response_json['message']).to eq(["Tutors name can't be blank",
                                                  'Tutors email is invalid'])
        end
      end
    end
  end
end