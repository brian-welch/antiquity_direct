module ApplicationHelper
  def user_photo
    if current_user.photo.nil?
      return "https://ui-avatars.com/api/?name=#{current_user.first_name}+
        #{current_user.last_name}&background=0D8ABC&color=eaec96"
    else
      return current_user.photo
    end
  end

  def booking_status(conf, decl)
    if decl
      return "declined"
    elsif conf
      return "confirmed"
    else
      return "pending"
    end
  end

  def booking_cost(art_id, out, retur)
    n = @artifacts.find(art_id).price * (retur - out).to_i
    Object.new.extend(ActionView::Helpers::NumberHelper).number_to_currency(n, unit: "€ ", separator: ".", delimiter: " ")
  end
end
