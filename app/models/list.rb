class List < ApplicationRecord

	belongs_to :user
	has_many :sublists, dependent: :destroy

	validates :subject, presence: true
	validates :content, presence: true
end
