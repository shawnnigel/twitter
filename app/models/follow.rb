class Follow < ActiveRecord::Base

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true

  include PublicActivity::Model
tracked owner: ->(controller, model) { controller && controller.current_user }

  def block!
    self.update_attribute(:blocked, true)
  end

end
