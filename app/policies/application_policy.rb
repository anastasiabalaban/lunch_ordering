class ApplicationPolicy
  def initialize(user, resource = nil, **context)
    @user     = user
    @resource = resource
    @context  = context
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  private

  attr_reader :user, :resource, :context

  def allowed
    true
  end

  def not_allowed
    false
  end

  def current_menu
    @current_menu ||= Menu.find_by(['DATE(created_at) = ?', Date.current])
  end

  alias_method :index?,   :not_allowed
  alias_method :show?,    :not_allowed
  alias_method :create?,  :not_allowed
  alias_method :update?,  :not_allowed
  alias_method :destroy?, :not_allowed

  public :index?, :show?, :create?, :update?, :destroy?
end
