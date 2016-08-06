class StudentDecorator < BaseDecorator
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    if object.subject_item_notes.where(subject_item: subject_item).count == 0
      return "0.00"
    else
      average = object.subject_item_notes.where(subject_item: subject_item).average(:value).to_s

      return "#{format("%.2f", average)}"
    end
  end
end
