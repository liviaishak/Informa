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

  class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       if user.admin?
         scope.all # if the user is an admin, show them all the wikis
       elsif user.premium?
         scope.public | user.wikis |user.shared.wikis
       else # this is the lowly standard user
         scope.public
       end
     end
   end
end
