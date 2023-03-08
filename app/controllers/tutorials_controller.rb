class TutorialsController < ApplicationController
  layout 'website'
  before_action :set_bg_color
  before_action :set_topics
  before_action :set_popular_articles, only: [:index]

  def index
  end

  def show
    @articles = Pathname.new(
      Rails.root.join('app/views/tutorial-files')
    ).children.select do |c|
      c.directory? && c.basename.to_s.ends_with?(params[:id])
    end.map do |p|
      p.children.select { |c| c.extname == ".md" }.map do |x|
        { file: x, topic: p.to_s.split('/').last }
      end
    end.flatten.map do |article|
      summary = article[:file].open.first(10).select { |l| l.size > 140 }.first
      article_filename = article[:file].basename.to_s.gsub(article[:file].extname, '')
      {
        path: article_filename,
        title: article_filename.titleize,
        summary: summary,
        topic: article[:topic]
      }
    end[0..7]
  end

  def article
    p params
    # @article = File.open(Rails.root.join('app/views/tutorial-files',))
  end

  private
  def set_bg_color
    @bg_color = 'bg-ninja-red'
  end

  def set_topics
    @topics = Pathname.new(
      Rails.root.join('app/views/tutorial-files')
    ).children.select { |c| c.directory? }.collect do |p|
      { path: p.to_s.split('/').last, article_count: article_count(p) }
    end[0..8]
  end

  def set_popular_articles
    @articles = Pathname.new(
      Rails.root.join('app/views/tutorial-files')
    ).children.select { |c| c.directory? }.map do |p|
      p.children.select { |c| c.extname == ".md" }.map do |x|
        { file: x, topic: p.to_s.split('/').last }
      end
    end.flatten.map do |article, topic|
      summary = article[:file].open.first(10).select { |l| l.size > 140 }.first
      article_filename = article[:file].basename.to_s.gsub(article[:file].extname, '')
      {
        path: article_filename,
        title: article_filename.titleize,
        summary: summary,
        topic: article[:topic]
      }
    end[0..7]
  end

  def article_count(dir)
    dir.children.select { |c| c.extname == ".md" }.size
  end
end
