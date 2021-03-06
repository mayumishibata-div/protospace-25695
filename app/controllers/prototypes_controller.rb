class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new

  end

  def create
    @prototype = Prototype.new(proto_params)
    # if Prototype.create(proto_params)
    if @prototype.save
      redirect_to action: :index and return
    else
      render :new
    end
  end

  private

  def proto_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
  end
end
