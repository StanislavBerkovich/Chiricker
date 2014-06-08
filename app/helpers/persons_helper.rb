module PersonsHelper
  def full_name some_user
    "#{some_user.name.capitalize}  #{some_user.surname.capitalize}"
  end

  def format_nic some_user
    "@#{some_user.nic}"
  end

  def how_old_is_post post
    str = "#{distance_of_time_in_words post.created_at, Time.now} ago"
  end
end
