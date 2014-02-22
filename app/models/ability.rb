class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    # user ||= User.new # guest user (not logged in)
        if user
            if user.role == "admin"
                can :manage, :all
            else
                can :read, :all
                can [:update], User do |u|
                    u == user
                end
                can :manage, Event, :team_id => user.team.id
                can :create, SuperBowlPick, :team_id => user.team.id
            end
        else
            can :read, :all
       end


       # Only registered users may do these things
        #unless user.nil?

            # All registered users can do these
            #can :read, [Award, Contract, Feature, Payout, Player, SalaryProgression, Standing, Subcontract, Team, TeamRecord]

            # Regular users
            #if user.role == "regular"
                # Let them update their email address, password, team name, avatar, etc
                #can [:update], User do |u|
                    #u == user
                #end
           # end

            #if user.role == "admin"
                #can :manage, :all
            #end
       # end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
