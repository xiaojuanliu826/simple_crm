class Customer < ApplicationRecord
  # ensure that full_name is present
  validates :full_name, presence: true

  # ensure that email_address is in a valid format (if present)
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  # ensure that image is attached
  has_one_attached :image

  # 1. 允许搜索的字段（根据你的表结构添加）
  def self.ransackable_attributes(auth_object = nil)
    ["full_name", "phone_number", "email_address", "notes", "created_at", "updated_at"]
  end

  # 2. 允许搜索的关联（如果你报错了，通常是因为这个）
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end
end

module ActiveStorage
  class Attachment
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
    end
  end

    class Blob
    def self.ransackable_attributes(auth_object = nil)
      ["id", "key", "filename", "content_type", "byte_size", "checksum", "created_at"]
    end
  end
end
