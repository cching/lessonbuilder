class SelectPdf < Prawn::Document
  require 'sanitize'

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
    text(@select.notes,
       :inline_format => true)
    move_down 10
    standards
    move_down 10
    first_table
    start_new_page
    second_table
    start_new_page
    third_table
    move_down 20
    fourth_table
  move_down 20
  header_table_content
  move_down 20
  notes
  move_down 20
  attachment

  if SelectVocab.where(:select_id => @select.id).any?
  start_new_page
  text "Vocabulary Assessment", :align => :center, :style => :bold, :size => 20, :background_color => '2F81D7', :text_color => 'ffffff'
  stroke do
    horizontal_rule
    move_down 30
  end
  vocab_assessment
  end

  if SelectQuestion.where(:select_id => @select.id).any?
  start_new_page
  text "Question Assessment", :align => :center, :style => :bold, :size => 20, :background_color => '2F81D7', :text_color => 'ffffff'
  stroke do
    horizontal_rule
    move_down 30
  end
  question_assessment
end

  if SelectAquestion.where(:select_id => @select.id).any?
  start_new_page
  text "Assessment Questions", :align => :center, :style => :bold, :size => 20, :background_color => '2F81D7', :text_color => 'ffffff'
  stroke do
    horizontal_rule
    move_down 30
  end
  aquestion_assessment
end
  end


def vocab_assessment
   SelectVocab.where(:select_id => @select.id).map do |vocab|
      text "#{vocab.xvocab.content_english} -"
      stroke do
        move_down 15
  horizontal_rule
  move_down 22
  horizontal_rule
  move_down 25
end
     end
   end

   def question_assessment
   SelectQuestion.where(:select_id => @select.id).map do |question|
      text "#{question.xquestion.content}"
      stroke do
        move_down 15
  horizontal_rule
  move_down 22
  horizontal_rule
  move_down 22
  horizontal_rule
  move_down 25
end
     end
   end

   def aquestion_assessment
   SelectAquestion.where(:select_id => @select.id).map do |question|
      text "#{question.xaquestion.content}"
      stroke do
        move_down 15
  horizontal_rule
  move_down 22
  horizontal_rule
  move_down 22
  horizontal_rule
  move_down 25
end
     end
   end

  def header_table_content
    @select.headers.map do |header|
    table([[header.title],
        [Sanitize.fragment(header.content)]
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

def notes
    table([['Instructional Plan'],
        [@select.notes, :inline_format => true]
      ], width: 500, :position => :center) do 
      row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
  move_down 5
  end

  def attachment
    table([['File Attachment'],
        [@select.try(:attachment_file_name)]
      ], width: 500, :position => :center) do 
      row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
  move_down 5
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