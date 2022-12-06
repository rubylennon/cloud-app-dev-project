class EntriesDecorator < Draper::Decorator

  def formatted_date
    object.published = Date.parse(object.published, '%Y-%m-%d')
  end
end