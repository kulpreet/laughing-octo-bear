class Todo < ActiveRecord::Base

  validates :description, :presence => true
  validates :priority, :numericality => {:allow_nil => true}

  belongs_to :user

  def to_json(options={})
    super(:only => [:id, :description, :due_date, :completed])
  end

end
