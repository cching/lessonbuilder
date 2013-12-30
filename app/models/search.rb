class Search < ActiveRecord::Base
  attr_accessible :grade_id, :subject_id
  belongs_to :grade
  belongs_to :user
  belongs_to :text
  
  validates :user_id, presence: true  
  
def standards
    @standards ||= find_standards
end
  
private
  def find_standards
    standards = Standard.order(:number)
    standards = standards.where(grade_id: grade_id) if grade_id.present?
    standards = standards.where(subject_id: subject_id) if subject_id.present?
    standards
  end
end
