class WikiPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    true
  end

  def destroy?
    user == wiki.user && user.present?
  end

  def create?
    user.present?
  end
end
