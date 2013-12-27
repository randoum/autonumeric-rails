class FormsController < ApplicationController
  create_action :through_form_helper
  create_action :dynamic_field

  def without_record
    @record = Record.new
  end

  def with_record
    @record = Record.find params[:id]
  end
end
