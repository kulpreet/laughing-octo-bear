class Todo < ActiveRecord::Base

  validates :description, :presence => true
  validates :priority, :numericality => {:allow_nil => true}

  belongs_to :user

end
