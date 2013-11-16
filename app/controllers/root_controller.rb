class RootController < ApplicationController
  def index

    @feeds = Feed.all.order('title ASC')
    @entries = Entry.includes([:feed]).order('published_at DESC').page(params[:page]).per(16)
    #@categories = Category.all(:include => :feeds)
    #@feeds = Feed.all

    respond_to do |format|
      format.html
      format.json { render :json => {
        :feeds   => @feeds,
        :entries => @entries
      }}
    end

  end

end
