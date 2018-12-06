class Contact < ApplicationRecord
    validates_presence_of :contact_name
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :contact_email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates_presence_of :contact_subject
end
