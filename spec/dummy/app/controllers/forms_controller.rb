class FormsController < ApplicationController

  before_action :set_test_version
  layout :set_layout

  create_action :static_fields
  create_action :javascript_fields
  create_action :get_content_from_ajax

  def ajax_fields
    @url_prefix = ''
  end

  def ajax_fields_with_record
    @url_prefix = "/#{params[:id]}"
    render action: :ajax_fields
  end

  private

    def without_record
      @record = Record.new
    end

    def with_record
      @record = Record.find params[:id]
    end

    def set_test_version
      @test_version = params[:test_version]
      raise 'Incorrect autoNumeric version, must be 1 or 2' if @test_version.blank? or ! @test_version =~ /^[1|2]$/
    end

    def set_layout
      "test_version_#{@test_version}"
    end

end
