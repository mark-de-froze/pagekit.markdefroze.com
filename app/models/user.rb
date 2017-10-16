class User < ApplicationRecord
  include Searchable

  has_many :keys

  resourcify

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_label
    "#{email}"
  end
end
