class Ability
  include CanCan::Ability
  
def initialize(user)
    user ||= User.new # guest user
    user.roles.each { |role|
      user.regions.each do |user_region|
      
       role_permissions = role.permissions.where("region_id=?",user_region.id)
       role_permissions.each { |permission|
        can permission.conduct.to_sym, permission.regulator.constantize
      }
      
    end
      cannot :delete, User, :id=>user.id
    }

    if user.role? :admin
      can :manage, :all
    else
      can :read , Medicine
    end
    
  end
end
