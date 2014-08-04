class SelectPdf < Prawn::Document
  def initialize(select)
    super(top_margin: 70)
    @select = select
    text "#{@select.try(:name)}", :align => :center, :style => :bold, :size => 20, :background_color => '2F81D7', :text_color => 'ffffff'
    if @select.book.try(:title) != nil 
    move_down 10
    text "Close Reading of", :align => :center
    
    text "#{@select.book.title}", :align => :center, :style => :italic
    end
    move_down 10
    text "Description: #{@select.description}", :align => :center

    move_down 10
    text "Objective: #{@select.objective}", :align => :center
    
    move_down 10
    standards
    move_down 10
    first_table
    move_down 20
    second_table
    move_down 20
    third_table
    move_down 20
    fourth_table
  move_down 20
  header_table_content
  end


  def header_table_content
    @select.headers.map do |header|
    table([[header.title],
        [header.content]
      ], width: 500, :position => :center) do 
      row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
  move_down 5
end
  end

def standards
    @select.standards.map do |standard|
    table([[standard.id],
        [standard.content]
      ], width: 500, :position => :center) do 
      row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
  move_down 5
end
  end

def first_table
  table([['Questions', 'Vocabulary'], [(questions if SelectQuestion.where(:select_id => @select.id).any?), (vocabs if SelectVocab.where(:select_id => @select.id).any?)]], width: 250+250, :position => :center) do
    row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
end

def second_table
  table([['Strategies', 'Skills'], [(strategies if SelectStrategy.where(:select_id => @select.id).any?), (skills if SelectSkill.where(:select_id => @select.id).any?)]], width: 250+250, :position => :center) do
    row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
end

def third_table
  table([['Assessment Questions'], [(aquestions if SelectAquestion.where(:select_id => @select.id).any?)]], width: 500, :position => :center) do
    row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
end

def fourth_table
  table([['Resources'], [(links if SelectLink.where(:select_id => @select.id).any?)]], width: 500, :position => :center) do
    row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
end

  def questions
  	
  	 SelectQuestion.where(:select_id => @select.id).map do |question|

  	 	[{ content: "#{question.xquestion.standard_id}: #{question.xquestion.content}", width: 250, border_bottom_color: 'ffffff', border_top_color: 'ffffff'} ]
  	 end
  	 
  end
def vocabs
    
     SelectVocab.where(:select_id => @select.id).map do |vocab|
      [{ content: "#{vocab.xvocab.standard_id}: #{vocab.xvocab.content_english}", width: 250, border_bottom_color: 'ffffff', border_top_color: 'ffffff'} ]
     end
     
  end

  def strategies
    
     SelectStrategy.where(:select_id => @select.id).map do |strategy|

      [{ content: "#{strategy.xstrategy.standard_id}: #{strategy.xstrategy.content}", width: 250, border_bottom_color: 'ffffff', border_top_color: 'ffffff'} ]
     end
     
  end
def skills
    
     SelectSkill.where(:select_id => @select.id).map do |skill|
      [{ content: "#{skill.xskill.standard_id}: #{skill.xskill.content}", width: 250, border_bottom_color: 'ffffff', border_top_color: 'ffffff'} ]
     end
     
  end

  def links
    SelectLink.where(:select_id => @select.id).map do |link|
      [{ content: "#{link.xlink.standard_id}: #{link.xlink.comment} #{link.xlink.link}", width: 500, border_bottom_color: 'ffffff', border_top_color: 'ffffff'} ]
     end
   end

   def aquestions
    SelectAquestion.where(:select_id => @select.id).map do |aquestion|
      [{ content: "#{aquestion.xaquestion.standard_id}: #{aquestion.xaquestion.content}", width: 500, border_bottom_color: 'ffffff', border_top_color: 'ffffff'} ]
   end
   end

end