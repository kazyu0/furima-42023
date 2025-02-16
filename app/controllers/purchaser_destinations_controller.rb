class PurchaserDestinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller_or_sold