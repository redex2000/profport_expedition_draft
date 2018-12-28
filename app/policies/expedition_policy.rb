class ExpeditionPolicy < ApplicationPolicy
  def index?
    @user.boss? || @user.cosmonaut?
  end


  def create?
    @user.boss?
  end
end
