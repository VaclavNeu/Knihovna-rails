module LoansHelper
  def loan_row_class(loan)
    return "" if loan.returned?

    if loan.end_date < Date.current
      "row-overdue"
    elsif loan.end_date == Date.current
      "row-due"
    else
      "row-active"
    end
  end
end
