class RecordsController < ApplicationController
  def create
    Record.create record_params
    render nothing: true
  end

  def update
    Record.find(params[:id]).update_attributes record_params
    render nothing: true
  end

  private

  def record_params
    params.require(:record).permit [:field1, :field2]
  end
end