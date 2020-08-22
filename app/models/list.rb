class List < ApplicationRecord

	belongs_to :user

	validates :subject, presence: true
	validates :content, presence: true
end
