class PublicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @authors = Author.as(:a).publications.as(:p).order('count(p) DESC').pluck(:a, 'count(p)').take(10)
    if params[:auth]
      @publications =  Author.as(:a).where('LOWER(a.name) = ?', params[:auth].downcase).publications.with_associations(:authors).page(params[:page]).per 10
    elsif params[:data]

      @publications = Publication.where(neo_id: Publication.search(params[:data], params[:type])).with_associations(:authors)
        .page(params[:page]).per 10
    else
      @publications = Publication.all.with_associations(:authors).page(params[:page]).per(10)
    end
  end
end
