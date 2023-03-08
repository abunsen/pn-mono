class TutorialsController < ApplicationController
  layout 'website'
  before_action :set_bg_color
  before_action :set_topics
  before_action :set_popular_articles, only: [:index]

  def index
  end

  def show
  end

  def article
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
      p.children.select { |c| c.extname == ".md" }
    end.flatten.map do |article|
      summary = article.open.first(10).select { |l| l.size > 140 }.first
      article_filename = article.basename.to_s.gsub(article.extname, '')
      {
        path: article_filename,
        title: article_filename.titleize,
        summary: summary
      }
    end[0..7]
  end

  def article_count(dir)
    dir.children.select { |c| c.extname == ".md" }.size
  end
end
