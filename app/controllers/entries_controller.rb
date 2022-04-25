class EntriesController < ApplicationController
  before_action :set_entry, only: [:destroy]
  before_action :set_params, only: [:create,:confirm,:confirm_back]

  def new
    @entry = Entry.new(room_id: params[:room_id])
  end

  def create

    respond_to do |format|
      if @entry.save
        format.html { redirect_to room_path(@entry.room),notice: "予約が完了しました！" }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @entry.destroy
        # format.html { redirect_to room_path(@entry.room), notion: "予約をキャンセルしました。"}
        format.js
      else
        format.js { head :no_content }
      end
    end

  end

  def index
    @entries = Entry.all
  end

  def confirm
    @entry.valid?
    # TODO: バリデーションチェックが必要です。

  end

  def confirm_back
    render :new
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def set_params
      @entry = Entry.new(entry_params)
    end

    def entry_params
      params.require(:entry).permit(:user_name,:user_email,:reserved_date,:usage_time,:room_id,:people)
    end
end
