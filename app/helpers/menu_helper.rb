module MenuHelper
  def today_menu_exists?
    Menu.exists?(['DATE(created_at) = ?', Date.current])
  end
end
