class TopController < ApplicationController

  def index
    # TODO: トップページです。（適切な挨拶文をビューに記載してください）
    @access_time = Time.current
  end
end
