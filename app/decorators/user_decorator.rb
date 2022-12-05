class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    object.first_name + ' ' + object.last_name
  end

  def account_type
    if object.admin == false
      "Admin Account"
    else
      "Standard User"
    end
  end
end