module MenuHelper
  def today_menu_exists?
    Menu.where('DATE(created_at) = ?', Date.today).exists?
  end
end
