# frozen_string_literal: true

class TicketsController < ApplicationController
  helper_method :ticket

  def index
    @tickets = Ticket.all.oldest_first
  end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def edit; end

  def create
    @ticket = Ticket.new(permitted_params)

    if ticket.save
      redirect_to tickets_path
    else
      render :new
    end
  end

  def update
    if ticket.update(permitted_params)
      redirect_to tickets_path
    else
      render :edit
    end
  end

  def destroy
    ticket.destroy

    redirect_to tickets_path
  end

  private

  def permitted_params
    params.require(:ticket).permit(:title)
  end

  def ticket
    @ticket ||= Ticket.find(params[:id])
  end
end
