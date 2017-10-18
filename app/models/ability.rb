class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :update, :create, :to => :modify
    if user.has_role? :authenticated
      if user.has_role? :administrator
        manager_site
        manager_users
        manager_portfolio
        manager_blog
        can :manage, :all
      else
        if user.has_role? :manager_site
          manager_site
        end
        if user.has_role? :manager_users
          manager_users
        end
        if user.has_role? :manager_portfolio
          manager_portfolio
        end
        if user.has_role? :manager_blog
          manager_blog
        end
      end
    end
  end

  def manager_users
    can :manage, [Users::Account, Users::Key, Users::Role]
  end

  def manager_site
    can :manage, [Site::Page, Site::Widget, Site::Link, Site::File, Site::Mail, Site::Setting]
  end

  def manager_portfolio
    can :manage, [Portfolio::Project, Portfolio::Image, Portfolio::Feedback, Portfolio::Category, Portfolio::Article]
  end

  def manager_blog
    can :manage, [Blog::Post, Blog::Comment]
  end
end
