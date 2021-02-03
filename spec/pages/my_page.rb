# frozen_string_literal: true

require 'pages/nav_section'

class My < SitePrism::Page
  section :nav, Nav
  element :header, 'h2'
  element :email, '#email'
  element :username, '#username'
  element :rank, '#rank'
  element :address, '#address'
  element :tel, '#tel'
  element :gender, '#gender'
  element :birthday, '#birthday'
  element :notification, '#notification'
# icon and delete pass
end