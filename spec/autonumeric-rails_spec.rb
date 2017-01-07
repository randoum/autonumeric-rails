require 'spec_helper'

describe 'Autonumeric-rails', type: :feature, js: true do

  subject { page }

  let(:expected_params) { {aSign: 'USD ', mDec: 1}.to_json }

  before {
    visit "/#{url}#{record_id}?test_version=#{test_version}"
    wait_for_jquery
  }

  describe 'autoNumeric version 1' do
    let(:test_version) { '1' }
    it_behaves_like 'test autonumeric-rails version'
  end

  describe 'autoNumeric version 2' do
    let(:test_version) { '2' }
    it_behaves_like 'test autonumeric-rails version'
  end

end