module ApplicationHelper
  def user_photo
    if current_user.photo.nil?
      return "https://ui-avatars.com/api/?name=#{me.first_name}+#{me.last_name}&background=0D8ABC&color=eaec96"
    else
      return current_user.photo
    end
  end
end
