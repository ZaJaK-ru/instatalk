module ApplicationHelper
  def users_online
    User.all.map{ |u| u.nickname if u.online? }.join(' ')
  end
end
