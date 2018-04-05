class WikiPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    user == wiki.user && user.present?
  end

  def update?
    user.present?
  end

end
