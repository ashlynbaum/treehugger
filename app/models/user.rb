class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :forest_type_badges
  has_many :forest_types, through: :forest_type_badges
  has_many :tree_badges
  has_many :trees, through: :tree_badges
end
