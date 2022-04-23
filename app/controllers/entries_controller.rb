class EntriesController < ApplicationController
  before_action :set_entry, only: [:destroy]

  def new
    @entry = Entry.new(room_id: params[:room_id])
  end

  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to room_path(@entry.room),notice: "Entry was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to @entry.room, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def index
    @entries = Entry.all
  end

  def confirm
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:user_name,:user_email,:reserved_date,:usage_time,:room_id,:people)
    end
end
