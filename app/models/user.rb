class User < ActiveRecord::Base

  has_many :tracks
  # has_many :likes

  validates_presence_of :username,
                        :password

  validates_uniqueness_of :username

  # def like_for_post_id(post_id)
  #   likes.find_by post_id: post_id
  # end

end
