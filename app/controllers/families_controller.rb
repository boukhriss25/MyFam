class FamiliesController < ApplicationController
  def index
    @memberships = Membership.where(user: current_user)
    @families = @memberships.family
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
