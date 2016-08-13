class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:private]
  def home
  end

  def about
  end

  def private
  end
end
