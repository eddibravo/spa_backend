require 'rails_helper'

RSpec.describe 'Posts api', type: :request do
  let(:post_factory) { FactoryGirl.create :post }
  before{ FactoryGirl.create_list(:post, 5) }

  describe 'GET #index' do
    before { get '/api/posts' }
    it{ expect(response).to have_http_status :success }
    it{ expect(json.length).to eq 5 }
  end

  describe 'GET #show' do
    before { get "/api/posts/#{post_factory.id}" }
    it{ expect(response).to have_http_status :success }
  end

  describe 'DELETE #destroy' do
    let!(:post_to_destroy) { FactoryGirl.create :post }
    let(:auth_header) { jwt_auth_header_for post_to_destroy.user }
    # it{ expect{ delete "/api/posts/#{post_factory.id}" }.to change(Post, :count).by(-1)} # почему-то не пашет
    it do
      delete "/api/posts/#{post_to_destroy.id}",  :headers => auth_header
      expect(Post.exists?(post_to_destroy.id)).to be_falsey
    end

  end

  describe 'PUT #update' do
    let(:auth_header) { jwt_auth_header_for post_factory.user }
      before do
        post_factory.title = 'Updated title'
        put "/api/posts/#{post_factory.id}", {:post => post_factory.attributes}, auth_header
        post_factory.reload
      end

    it { expect(post_factory.title).to eq('Updated title') }
  end

  describe 'POST #create'  do
    let!(:new_post) { FactoryGirl.build :post }
    let(:auth_header) { jwt_auth_header_for new_post.user }
    it do
      post '/api/posts', {:post => {:title => new_post.title, :body => new_post.body}}, auth_header
      expect(response).to have_http_status :created
    end

    it{ expect{ post '/api/posts', { :post => new_post.attributes }, auth_header }.to change(Post, :count).by(1) }
  end

end