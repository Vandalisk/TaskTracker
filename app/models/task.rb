class Task < ActiveRecord::Base
	belongs_to :project
	validates :title, :customer, :performer, presence: true
end
