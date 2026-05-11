class MembersController < ApplicationController
before_action :set_member, only: %i[show destroy]
  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to member_path(@member), notice:  "Člen byl úspěšně přidán."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
      if @member.loans.any?
    redirect_to @member, alert: "Nelze smazat člena, dokud má aktivní výpůjčky. Nejprve ukončete všechny výpůjčky."
      else
    @member.destroy
    redirect_to members_path, notice: "Člen byl smazán."
      end
  end

  def set_member
    @member = Member.find(params[:id])
  end
  def member_params
    params.require(:member).permit(:name, :email)
  end
end
