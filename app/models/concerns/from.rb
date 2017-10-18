module From
  extend ActiveSupport::Concern

  included do
    validates :from_name, :from_email, presence: true
    validates :from_email, email: true
  end

  def from
    "#{from_name} <#{from_email}>"
  end
end