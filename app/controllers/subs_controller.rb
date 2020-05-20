class SubsController < ApplicationController
before_action :set_sub, only: [:show,:edit,:destroy,:update]
  
  def index
    @subs = Sub.all
  end

  def show
    # @sub = Sub.find(params[:id]) is being called with before action
  end

  def new
    @sub = Sub.new
    render partial: "form"
  end

  def create
    @sub = Sub.new(subs_params)
    if @sub.save #saves to the database
      redirect_to subs_path #subs path will take you back to the index
    else
      render :new # calls the function new to try again
    end
  end

  def edit
    # @sub = Sub.find(params[:id]) is being called with before action
    render partial: "form"


  end

  def update
    # @sub = Sub.find(params[:id]) is being called with before action
    if @sub.update(subs_params)
      redirect_to subs_path(@sub)
    else
      render :edit
    end
end

  def destroy
    # @sub = Sub.find(params[:id]) is being called with before action
    @sub.destroy
    redirect_to subs_path #subs path will take you back to the index
  end

  private

  def subs_params
    params.require(:sub).permit(:name)
  end

  def set_sub
    @sub = Sub.find(params[:id])

  end

end
