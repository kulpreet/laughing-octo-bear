require "#{Rails.root}/lib/todo_methods"

class TodosController < ApplicationController

  before_filter :authenticate_user!
  respond_to :html, :json, :xml

  include TodoMethods

end
