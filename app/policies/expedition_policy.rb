class ExpeditionPolicy < ApplicationPolicy
  def index?
    @user.boss? || @user.cosmonaut?
  end


  def destroy?
    @user.boss?
  end


  def create?
    @user.boss?
  end


  def show?
    @user.boss? || @user.cosmonaut?
  end
end
