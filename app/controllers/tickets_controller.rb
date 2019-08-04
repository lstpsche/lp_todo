class TicketsController < ApplicationController
  helper_method :ticket, :tickets, :new_ticket

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    new_ticket(permitted_params)

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

  def tickets
    @tickets ||= Ticket.all
  end

  def ticket
    @ticket ||= Ticket.find(params[:id])
  end

  def new_ticket(ticket_params = {})
    @ticket ||= Ticket.new(ticket_params)
  end
end
