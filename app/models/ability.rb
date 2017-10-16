class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :update, :create, :to => :modify
    if user.has_role? :authenticated
      if user.has_role? :administrator
        manager_site
        manager_users
        can :manage, :all
      elsif user.has_role? :manager_site
        manager_site
      elsif user.has_role? :manager_users
        manager_users
      end
    end
  end

  def manager_users
    can :manage, [Users::Account, Users::Key, Users::Role]
  end

  def manager_site
    can :manage, [Site::Page, Site::Widget, Site::Link, Site::File, Site::Mail, Site::Setting]
  end
end
