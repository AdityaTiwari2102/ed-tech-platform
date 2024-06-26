require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/tutors', type: :request do

  # This should return the minimal set of attributes required to create a valid
  # Tutor. As you add validations to Tutor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:tutor, course: create(:course)).attributes.except('id', 'created_at', 'updated_at')
  }

  let(:invalid_attributes) {
    { name: '', email: '', course_id: '' }
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      Tutor.create! valid_attributes
      get tutors_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      tutor = Tutor.create! valid_attributes
      get tutor_url(tutor)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_tutor_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      tutor = Tutor.create! valid_attributes
      get edit_tutor_url(tutor)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Tutor' do
        expect {
          post tutors_url, params: { tutor: valid_attributes }
        }.to change(Tutor, :count).by(1)
      end

      it 'redirects to the created tutor' do
        post tutors_url, params: { tutor: valid_attributes }
        expect(response).to redirect_to(tutor_url(Tutor.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Tutor' do
        expect {
          post tutors_url, params: { tutor: invalid_attributes }
        }.to change(Tutor, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post tutors_url, params: { tutor: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { name: 'RC Dutta', email: 'rc.dutta@example.com', course_id: create(:course).id }
      }

      it 'updates the requested tutor' do
        tutor = Tutor.create! valid_attributes
        patch tutor_url(tutor), params: { tutor: new_attributes }
        tutor.reload
        expect(tutor.name).to eq('RC Dutta')
        expect(tutor.email).to eq('rc.dutta@example.com')
        expect(tutor.course_id).to eq(Course.last.id)
      end

      it 'redirects to the tutor' do
        tutor = Tutor.create! valid_attributes
        patch tutor_url(tutor), params: { tutor: new_attributes }
        tutor.reload
        expect(response).to redirect_to(tutor_url(tutor))
      end
    end

    context 'with invalid parameters' do

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        tutor = Tutor.create! valid_attributes
        patch tutor_url(tutor), params: { tutor: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested tutor' do
      tutor = Tutor.create! valid_attributes
      expect {
        delete tutor_url(tutor)
      }.to change(Tutor, :count).by(-1)
    end

    it 'redirects to the tutors list' do
      tutor = Tutor.create! valid_attributes
      delete tutor_url(tutor)
      expect(response).to redirect_to(tutors_url)
    end
  end
end
