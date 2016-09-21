require 'rails_helper'
require 'carrierwave/test/matchers'

describe FileUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) { FileUploader.new }

  before do
    FileUploader.enable_processing = true
    File.open(Rails.root.join('spec/fixtures/picture.jpg')) { |f| uploader.store!(f) }
  end

  after do
    FileUploader.enable_processing = false
     uploader.remove!
  end

  describe 'версии' do

    context 'thumb' do
      it { expect(uploader.thumb).to have_dimensions(200, 200) }
    end

    context 'small_thumb' do
      it { expect(uploader.small_thumb).to be_no_larger_than(80, 80) }
    end
  end

  it { expect(uploader).to have_permissions(0600) }
  it { expect(uploader).to be_format('png') }
end