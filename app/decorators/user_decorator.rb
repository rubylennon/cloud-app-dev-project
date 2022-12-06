class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    if object.first_name.nil? || object.last_name.nil?
      "Name Blank"
    else
      object.first_name + ' ' + object.last_name
    end
  end

  def account_type
    if object.admin == false
      "Admin Account"
    else
      "Standard User"
    end
  end
end