class EntriesController < ApplicationController
  before_action :set_entry, only: [:destroy]
  before_action :set_params, only: [:create,:confirm,:confirm_back]

  def new
    @entry = Entry.new(user_name: current_user.name, user_email: current_user.email, room_id: params[:room_id])
  end

  def create

    if @entry.save
      # TODO: notionメッセージの表示
      redirect_to @entry.room, notice: t('message.complate'), model: @entry.model_name.human
    else
      render :new
    end
  end

  def destroy
    # TODO: 条件判定はnameではなくidなどで行うので変更する
    if @entry.user_name == current_user.name
      respond_to do |format|
        @entry.destroy
        # TODO: notionメッセージの表示
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
