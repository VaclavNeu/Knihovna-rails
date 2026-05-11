class LoansController < ApplicationController
 before_action :set_loan, only: %i[ show destroy return_book]
  def index
    @loans = Loan.includes(:book, :member).order(start_date: :desc)
  end

  def show
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      redirect_to @loan, notice: "Knížka byla úspěšně vypůjčena."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @loan.deletable?
    @loan.destroy
    redirect_to loans_path, notice: "Výpůjčka byla smazána."
    else
    redirect_to loans_path, alert: "Výpůjčku nelze smazat, dokud nebude kniha vrácena."
    end
  end
  def return_book
    @loan.mark_as_returned!
    redirect_to @loan, notice: "Knížka byla úspěšně vrácena."
  end
  def set_loan
    @loan = Loan.find(params[:id])
  end
  def loan_params
    params.require(:loan).permit(:book_id, :member_id, :start_date, :end_date)
  end
end
