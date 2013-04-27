class UsersController < ApplicationController
  
  def index
     @medicines = Medicine.all
     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @medicines }
     end
  end
end
