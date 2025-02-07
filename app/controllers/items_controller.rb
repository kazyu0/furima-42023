class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
end

private

def itemlisting_params
  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end