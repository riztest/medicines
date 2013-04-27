class MedicinesController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "admin"
  def index
     @medicines = Medicine.all
     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @medicines }
     end
  end
  def show
    @medicine = Medicine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medicine }
    end
  end
  def new
    @medicine = Medicine.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medicine }
    end
  end
  def edit
    @medicine = Medicine.find(params[:id])
  end
  def create
    @medicine = Medicine.new(params[:medicine])
    respond_to do |format|
      if @medicine.save
        format.html { redirect_to @medicine, notice: 'Medicine has been created successfully.' }
        format.json { render json: @medicine, status: :created, location: @medicine }
      else
        format.html { render action: "new" }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @medicine = Medicine.find(params[:id])
    respond_to do |format|
      if @medicine.update_attributes(params[:medicine])
        format.html { redirect_to @medicine, notice: 'Medicine has been successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @medicine = Medicine.find(params[:id])
    @medicine.destroy

    respond_to do |format|
      format.html { redirect_to medicines_url }
      format.json { head :no_content }
    end
  end

end
