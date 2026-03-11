class Customer < ApplicationRecord
  # ensure that full_name is present
  validates :full_name, presence: true

  # ensure that email_address is in a valid format (if present)
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  # ensure that image is attached
  has_one_attached :image
end
