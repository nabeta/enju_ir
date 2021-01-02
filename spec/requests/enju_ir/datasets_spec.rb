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

module EnjuIr
  RSpec.describe "/enju_ir/datasets", type: :request do
    # Dataset. As you add validations to Dataset, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      FactoryBot.attributes_for(:dataset)
    }

    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    fixtures :all

    describe "GET /index" do
      it "renders a successful response" do
        FactoryBot.create(:dataset)
        get enju_ir.datasets_url
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        dataset = FactoryBot.create(:dataset)
        get enju_ir.dataset_url(dataset)
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      before(:each) do
        sign_in users(:user1)
      end

      it "renders a successful response" do
        get enju_ir.new_dataset_url
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      before(:each) do
        sign_in users(:user1)
      end

      it "render a successful response" do
        dataset = FactoryBot.create(:dataset, user: users(:user1))
        get enju_ir.edit_dataset_url(dataset)
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        before(:each) do
          sign_in users(:user1)
          @doi_record = FactoryBot.create(:doi_record)
        end

        it "creates a new Dataset" do
          expect {
            post enju_ir.datasets_url, params: { dataset: valid_attributes.merge(doi_string: @doi_record.body) }
          }.to change(Dataset, :count).by(1)
        end

        it "redirects to the created dataset" do
          post enju_ir.datasets_url, params: { dataset: valid_attributes.merge(doi_string: @doi_record.body) }
          expect(response).to redirect_to(enju_ir.dataset_url(Dataset.last))
        end
      end

      context "with invalid parameters" do
        before(:each) do
          sign_in users(:user1)
        end

        it "does not create a new Dataset" do
          expect {
            post enju_ir.datasets_url, params: { dataset: invalid_attributes }
          }.to change(Dataset, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post enju_ir.datasets_url, params: { dataset: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested dataset" do
          dataset = FactoryBot.create(:dataset)
          patch enju_ir.dataset_url(dataset), params: { dataset: new_attributes }
          dataset.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the dataset" do
          dataset = FactoryBot.create(:dataset)
          patch enju_ir.dataset_url(dataset), params: { dataset: new_attributes }
          dataset.reload
          expect(response).to redirect_to(dataset_url(dataset))
        end
      end

      context "with invalid parameters" do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          dataset = FactoryBot.create(:dataset)
          patch enju_ir.dataset_url(dataset), params: { dataset: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE /destroy" do
      before(:each) do
        sign_in users(:user1)
      end

      it "destroys the requested dataset" do
        dataset = FactoryBot.create(:dataset, user: users(:user1))
        expect {
          delete enju_ir.dataset_url(dataset)
        }.to change(Dataset, :count).by(-1)
      end

      it "redirects to the datasets list" do
        dataset = FactoryBot.create(:dataset, user: users(:user1))
        delete enju_ir.dataset_url(dataset)
        expect(response).to redirect_to(enju_ir.datasets_url)
      end
    end
  end
end
