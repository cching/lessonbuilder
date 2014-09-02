#!/bin/env ruby
# encoding: utf-8

class SelectPdf < Prawn::Document
  def initialize(select)
    super(top_margin: 70)
    @select = select
    text "#{@select.try(:name)}", :align => :center, :style => :bold, :size => 20, :background_color => '2F81D7', :text_color => 'ffffff'
    text "(Teaching on #{@select.date})", :align => :center

    unless @select.description.blank?
    move_down 10
    text "Description: #{@select.description}", :align => :center
  end
    unless @select.objective.blank?
    move_down 10
    text "Objective: #{@select.objective}", :align => :center
    end
move_down 20
  notes
  indent(30) do
  text render_html_text(@select.notes), :inline_format => true
end
start_new_page
standards_content
    

    if SelectQuestion.where(:select_id => @select.id).any?
    first_table
    move_down 20
    end
    
    if SelectVocab.where(:select_id => @select.id).any?
    vocab_table
    move_down 20
    end

    if SelectSkill.where(:select_id => @select.id).any?
    skill_table 
    move_down 20
    end

    if SelectAquestion.where(:select_id => @select.id).any?
    third_table
    move_down 20
    end
    if SelectLink.where(:select_id => @select.id).any?
    fourth_table
  move_down 20
end
  header_table_content
  
  move_down 20
  attachment

  if SelectVocab.where(:select_id => @select.id).any?
  start_new_page
  text "Name:", :align => :left
    horizontal_rule
  move_down 20
  text "Date:", :align => :left
    horizontal_rule
    move_down 25
  text "Vocabulary Assessment", :align => :center, :style => :bold, :size => 20, :background_color => '2F81D7', :text_color => 'ffffff'
  stroke do
    horizontal_rule
    move_down 30
  end
  vocab_assessment
  end

  if SelectQuestion.where(:select_id => @select.id).any?
  start_new_page
  text "Name:", :align => :left
    horizontal_rule
  move_down 20
  text "Date:", :align => :left
    horizontal_rule
    move_down 25
  text "Question Assessment", :align => :center, :style => :bold, :size => 20, :background_color => '2F81D7', :text_color => 'ffffff'
  stroke do
    horizontal_rule
    move_down 30
  end
  question_assessment
end

  if SelectAquestion.where(:select_id => @select.id).any?
  start_new_page
  text "Name:", :align => :left
    horizontal_rule
  move_down 20
  text "Date:", :align => :left
    horizontal_rule
    move_down 25
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

def standards_content
   
  table([@select.standards.map do |standard|
      standard.id
    end] +
    [@select.standards.map do |standard|
      standard.content
    end], :position => :center
    ) do 
      row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end

  end

  def standard_header
    @select.standards.map do |standard|
    [standard.id]
    end
  end

  def standard_content
    @select.standards.map do |standard|
    [standard.content]
    end
  end

def notes
    table([['Instructional Plan']
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
  table([['Questions'], [(questions if SelectQuestion.where(:select_id => @select.id).any?)]], width: 500, :position => :center) do
    row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
end


def vocab_table
  table([['Vocabulary'], [(vocabs if SelectVocab.where(:select_id => @select.id).any?)]], width: 500, :position => :center) do
    row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
end

def skill_table
  table([['Skills'], [(skills if SelectSkill.where(:select_id => @select.id).any?)]], width: 500, :position => :center) do
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
  table([['Links'], [(links if SelectLink.where(:select_id => @select.id).any?)]], width: 500, :position => :center) do
    row(0).align = :center
    row(0).font_style = :bold
    row(0).background_color = '82b3e7'
    row(0).text_color = 'ffffff'
  end
end

  def questions
  	
  	 SelectQuestion.where(:select_id => @select.id).map do |question|

  	 	[{ content: "#{question.xquestion.standard_id}: #{question.xquestion.content}", width: 500, border_bottom_color: '000000', border_top_color: 'ffffff'} ]
  	 end
  	 
  end



def vocabs
    
     SelectVocab.where(:select_id => @select.id).map do |vocab|
      [{ content: "#{vocab.xvocab.standard_id}: #{vocab.xvocab.content_english}", width: 500, border_bottom_color: '000000', border_top_color: 'ffffff'} ]
     end
     
  end


def skills
    
     SelectSkill.where(:select_id => @select.id).map do |skill|
      [{ content: "#{skill.xskill.standard_id}: #{skill.xskill.content}", width: 500, border_bottom_color: '000000', border_top_color: 'ffffff'} ]
     end
     
  end


  def links
    SelectLink.where(:select_id => @select.id).map do |link|
      [{ content: "#{link.xlink.standard_id}: #{link.xlink.comment} #{link.xlink.link}", width: 500, border_bottom_color: '000000', border_top_color: 'ffffff'} ]
     end
   end

   def aquestions
    SelectAquestion.where(:select_id => @select.id).map do |aquestion|
      [{ content: "#{aquestion.xaquestion.standard_id}: #{aquestion.xaquestion.content}", width: 500, border_bottom_color: '000000', border_top_color: 'ffffff'} ]
   end
   end



   def render_html_text(text)
  #render text (indented if inside ul)
  indent = 0 #current indentation (absolute, e.g. n*indent_delta for level n)
  indent_delta = 10 #indentation step per list level
  states = [] #whether we have an ol or ul at level n
  indices = [] #remembers at which index the ol list at level n, currently is

  #while there is another list tag do
  #  => starting position of list tag is at i
  #  render everything that comes before the tag
  #  cut everything we have rendered from the whole text
  #end
  while (i = text.index /<\/?[ou]l>/) != nil do
    part = text[0..i-1]
    if indent == 0 #we're not in a list, but at the top level
    else
      indent indent do
        #render all the lis
        part.gsub(/<\/li>/, '').split('<li>').each do |item|
          next if item.blank? #split may return some ugly start and end blanks

          item_text = if states.last == :ul
                        "• #{item}"
                      else # :ol
                        indices[indices.length-1] = indices.last + 1
                        "#{indices.last}. #{item}"
                      end

          text item_text, :inline_format => true
        end
      end
    end

    is_closing = text[i+1] == '/' #closing tag?
    if is_closing
      indent -= indent_delta
      i += '</ul>'.length

      states.pop
      indices.pop
    else
      move_down 10 if indent == 0

      type_identifier = text[i+1] #<_u_l> or <_o_l>
      states << if type_identifier == 'u'
                  :ul
                elsif type_identifier == 'o'
                  :ol
                else
                  raise "what means type identifier '#{type_identifier}'?"
                end
      indices << 0

      indent += indent_delta
      i += '<ul>'.length
    end

    text = text[i..text.length-1] #cut the text we just rendered
  end

  #render the last part
  text text, :inline_format => true unless text.blank?
end

end