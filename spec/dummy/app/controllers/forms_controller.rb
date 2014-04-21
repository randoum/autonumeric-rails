class FormsController < ApplicationController

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
end
