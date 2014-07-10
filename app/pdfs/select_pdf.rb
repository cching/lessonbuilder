class SelectPdf < Prawn::Document
  def initialize(select)
    super(top_margin: 70)
    @select = select
    text "#{@select.name}", :align => :center, :style => :bold

    move_down 10
    text "Close Reading of", :align => :center
    text "#{@select.book.title}", :align => :center, :style => :italic

    move_down 10
    text "Description: #{@select.description}", :align => :center

    move_down 10
    text "Objective: #{@select.objective}", :align => :center
    if SelectQuestion.where(:select_id => @select.id).any?
    move_down 20
    standard_table_content
  else
  end

    if SelectQuestion.where(:select_id => @select.id).any?
    move_down 20
    question_table_content
  else
  end


if SelectSkill.where(:select_id => @select.id).any?
    move_down 20
    skill_table_content
  else
  end


if SelectStrategy.where(:select_id => @select.id).any?
    move_down 20
    strategy_table_content
  else
  end

if SelectVocab.where(:select_id => @select.id).any?
    move_down 20
    vocab_table_content
  else
  end


if SelectLink.where(:select_id => @select.id).any?
    move_down 20
    link_table_content
  else
  end

    move_down 20
    if SelectAquestion.where(:select_id => @select.id).any?
    aquestion_table_content
  else
  end
  end

 
  def standard_table_content
    table([['Standards'],
    		[standards]

    	]) do 
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
    end
  end

  def question_table_content
    table([['Questions'],
    		[questions]
    	]) do 
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
  end
end

  def skill_table_content
    table([['Skills'],
    		[skills]
    	]) do 
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
  end


  end

  def strategy_table_content
    table([['Strategies'],
    		[strategies]
    	]) do 
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
  end


  end

  def vocab_table_content
    table([['Vocabulary'],
    		[vocabs]
    	]) do 
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
  end


  end

  def link_table_content
    table([['Resources'],
    		[links]
    	]) do 
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
  end


  end

  def aquestion_table_content
    table([['Assessment Questions'],
    		[aquestions]
    	]) do 
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
  end


  end

  def standards

  	@select.standards.map do |standard| 
  		[standard.id, standard.content]
  	end
  end

  def questions
  	
  	 SelectQuestion.where(:select_id => @select.id).map do |question|

  	 	[question.question.standard_id, question.content]
  	 end
  	 
  end

  def skills
  	SelectSkill.where(:select_id => @select.id).map do |skill|
  		[skill.skill.standard_id, skill.content]
  	end
  end

  def strategies
  	SelectStrategy.where(:select_id => @select.id).map do |strategy|
  		[strategy.strategy.standard_id, strategy.content]
  	end
  end

  def vocabs
  	SelectVocab.where(:select_id => @select.id).map do |vocab|
  		[vocab.vocab.standard_id, vocab.content_english]
  	end
  end

  def links
  	SelectLink.where(:select_id => @select.id).map do |link|
  		[link.link.standard_id, link.comment]
  	end
  end

def aquestions
  	SelectAquestion.where(:select_id => @select.id).map do |aquestion|
  		[aquestion.aquestion.standard_id, aquestion.content]
  	end
  end

end