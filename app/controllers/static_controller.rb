class StaticController < ApplicationController
  layout 'website'
  before_action :set_bg_color, except: [:home]
  before_action :set_show_cta, only: [:home]

  def home
  end

  def about
  end

  def pricing
  end

  private
  def set_bg_color
    @bg_color = 'bg-ninja-red'
  end

  def set_show_cta
    @show_cta = true
  end
end
