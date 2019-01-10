class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record, **context)
    @user = user
    @record = record
    @context = context
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  private

  def current_menu
    @current_menu ||= Menu.find_by(['DATE(created_at) = ?', Date.current])
  end
end
