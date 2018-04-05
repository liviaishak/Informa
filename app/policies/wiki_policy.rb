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

  def index?
    true
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    user.present?
  end

end
