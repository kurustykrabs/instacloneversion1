class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy

  has_many :followings, through: :active_relationships
  has_many :followers, through: :passive_relationships
end
