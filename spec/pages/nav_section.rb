# frozen_string_literal: true

class Nav < SitePrism::Section
  set_default_search_arguments 'nav'

  element :login_link, :link, 'ログイン'
  element :signup_link, :link, '会員登録'
  element :plan_link, :link, '宿泊予約'
end