class TutorialsController < ApplicationController
  layout 'website'
  before_action :set_bg_color
  before_action :set_topics

  def index
  end

  def show

  end

  private
  def set_bg_color
    @bg_color = 'bg-ninja-red'
  end

  def set_topics
    @topics = Pathname.new(Rails.root.join('app/views/tutorial-files')).children.select { |c| c.directory? }.collect { |p| p.to_s.split('/').last }
  end
end
