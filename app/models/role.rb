class Role < ApplicationRecord
  include Searchable

  resourcify

  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def to_label
    if resource_id
      resource_label = resource.to_label
    end

    "#{name.humanize} #{resource_label}"
  end
end
