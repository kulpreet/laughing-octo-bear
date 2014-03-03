require "#{Rails.root}/lib/todo_methods"

module Api::V1
  class TodosController < ApiController
    doorkeeper_for :all
    respond_to :json

    include TodoMethods
  end
end
