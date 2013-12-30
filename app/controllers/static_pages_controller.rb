class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  end
  
  def questions
    @search = Search.last
  end
  
  def skills
  end
  
  def texts
    @text = Text.all
  end
  
  def edit_questions
  end
  
end
