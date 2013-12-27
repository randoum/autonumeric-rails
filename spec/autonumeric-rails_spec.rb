require 'spec_helper'

shared_examples 'all autonumeric-rails tests' do
  context 'Without DB' do
    let(:record_id) { '' }

    it 'Input tag' do
      assert_selector("input#record_field1[name='record[field1]'][data-autonumeric='true']")
      assert_selector("input#record_field2[name='record[field2]'][data-autonumeric='#{params}']")
    end

    it 'Hidden tags' do
      assert_selector("input#record_field1_val[name='record[field1]'][type='hidden']")
      assert_selector("input#record_field2_val[name='record[field2]'][type='hidden']")
    end

    it 'Hidden tag is located after Input tag' do
      find(:xpath, ".//*[@id='record_field1']/following-sibling::*[1]")['id'].should eq('record_field1_val')
      find(:xpath, ".//*[@id='record_field2']/following-sibling::*[1]")['id'].should eq('record_field2_val')
    end

    it 'Set empty default values' do
      find('#record_field1').value.should eq('')
      find('#record_field1_val').value.should eq('')

      find('#record_field2').value.should eq('')
      find('#record_field2_val').value.should eq('')
    end

    it 'Typing value updates hidden field value' do
      find('#record_field1').set '12345'
      find('#record_field2').set '54321.987'

      find('#record_field1').value.should eq('12,345.00')
      find('#record_field1_val').value.should eq('12345')

      find('#record_field2').value.should eq('USD 54,321.9')
      find('#record_field2_val').value.should eq('54321.9')
    end

    it 'Creates record without values' do
      click_button 'Go'

      from_db = Record.last
      from_db.field1.should eq(nil)
      from_db.field2.should eq(nil)
    end

    it 'Creates record with values' do
      find('#record_field1').set '122333'
      find('#record_field2').set '4444.5'
      click_button 'Go'

      from_db = Record.last
      from_db.field1.should eq(122333)
      from_db.field2.should eq(4444.5)
    end
  end

  context 'With DB record' do
    let(:record) { Record.create field1: 112233, field2: 445566.7 }
    let(:record_id) { "/#{record.id}" }

    it 'Loads record and set values' do
      find('#record_field1').value.should eq('112,233.00')
      find('#record_field1_val').value.should eq('112233')

      find('#record_field2').value.should eq('USD 445,566.7')
      find('#record_field2_val').value.should eq('445566.7')
    end

    it 'Without modifying values' do
      click_button 'Go'

      from_db = Record.find record.id
      from_db.field1.should eq(112233)
      from_db.field2.should eq(445566.7)
    end

    it 'Updates record' do
      find('#record_field1').set '332211'
      find('#record_field2').set '776655.4'
      click_button 'Go'

      from_db = Record.find record.id
      from_db.field1.should eq(332211)
      from_db.field2.should eq(776655.4)
    end
  end
end



describe 'Autonumeric-rails', type: :feature, js: true do

  subject { page }

  let(:params) { {aSign: 'USD ', mDec: 1}.to_json }

  before { visit "/#{url}#{record_id}" }
  before { wait_for_jquery }

  context 'Through form helper' do
    let(:url) { 'through_form_helper' }
    it_behaves_like 'all autonumeric-rails tests'
  end

  context 'With dynamically created fields' do
    let(:url) { 'dynamic_field' }
    it_behaves_like 'all autonumeric-rails tests'
  end

end