require 'spec_helper'

describe 'Autonumeric-rails', type: :feature, js: true do

  subject { page }

  let(:params) { {aSign: 'USD ', mDec: 1}.to_json }

  before {
    visit "/#{url}#{record_id}"
    wait_for_jquery
  }

  context 'Through form helper' do
    let(:url) { 'static_fields' }
    it_behaves_like 'all autonumeric-rails tests'
  end

  context 'Javascript manually created fields' do
    let(:url) { 'javascript_fields' }
    it_behaves_like 'all autonumeric-rails tests'
  end

  context 'AJAX request created fields' do
    let(:url) { 'ajax_fields' }
    it_behaves_like 'all autonumeric-rails tests'
  end

end