class ItemPolicy < ApplicationPolicy
  %i[index? create? update? destroy?].each do |m|
    define_method(m) { user.admin? }
  end
end
