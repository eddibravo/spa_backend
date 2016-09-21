require 'rails_helper'

RSpec.describe 'Posts api', type: :request do
  include CarrierWave::Test::Matchers

  describe 'POST /upload' do
    let!(:user) { FactoryGirl.create :user }
    let!(:auth_header) { jwt_auth_header_for user }

    context 'валидная загрузка' do
      before do
        post '/api/upload', { :image => fixture_file_upload(Rails.root.join('spec', 'fixtures', 'picture.jpg')) }, auth_header
      end #config.fixture_path по какой-то причине игнорируется, будь до фикстуры прописываю прямой.

      it { expect(response).to have_http_status(:created)}
      it { expect(File.exists?(Rails.root.join('public', 'uploads', File.basename(json['url'])))).to be_truthy }
    end

    context 'загрузка от неавторизованного юзера' do
      before do
        post '/api/upload', { :image => fixture_file_upload(Rails.root.join('spec', 'fixtures', 'picture.jpg')) }
      end
      it { expect(response).to have_http_status(401)}
    end

    context 'только белый список расширений' do
      before do
        post '/api/upload', { :image => fixture_file_upload(Rails.root.join('spec', 'fixtures', 'not_image.pdf')) }, auth_header
      end
      it { expect(response).to have_http_status(422)}
    end
  end
end