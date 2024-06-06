class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Follow'
         has_many :followers, through: :follower_relationships, source: :follower

         has_many :followed_relationships, foreign_key: :follower_id, class_name: 'Follow'
         has_many :followeds, through: :followed_relationships, source: :followed

         has_many :memberships
         has_many :chat_rooms, through: :memberships
         has_many :messages
end
