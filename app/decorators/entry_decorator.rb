# frozen_string_literal: true

# decorator class for entry model
class EntryDecorator < Draper::Decorator
  delegate_all

  def valid_content
    if object.content.nil?
      'Clicked the link to view the blog entry...'
    else
      object.content
    end
  end
end
