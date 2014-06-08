module PersonsHelper
  def full_name some_user
    "#{some_user.name.capitalize}  #{some_user.surname.capitalize}"
  end

  def format_nic some_user
    "@#{some_user.nic}"
  end
end
