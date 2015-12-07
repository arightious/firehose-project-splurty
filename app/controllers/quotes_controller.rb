class QuotesController < ApplicationController
def index
	@quote = Quote.order("RANDOM()").first
end

def create
	@quote = Quote.create(quote_params)
	if @quote.invalid?
		flash[:error] = 'Your entry was <strong>too short, or too long</strong>. Try again.'
	end
	redirect_to root_path
end

def about
  end

  def show
    @quote = Quote.where(:id => params[:id]).first
    if @quote.blank?
      render :text => "You look lost...", :status => :not_found
    end
  end

private

def quote_params
	params.require(:quote).permit(:saying, :author)
end

end
