# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      score 10, :on => 'users#create' do |user|
        user.bio.present?
      end
      #needs to speak with user/room_chore
      #must add points if chore if complete WHEN period of time ends and new chore is assigned
      #right now, points are being awarded for creating posts/reviewing
      #I tried to screw around, but am lost on conditionals here

      score 15, :on => 'chores#create', :to => [:reviewer, :reviewed]

      score -10, :on => 'chores#destroy'
    end
  end
end
