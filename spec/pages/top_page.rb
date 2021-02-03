# frozen_string_literal: true

require 'pages/nav_section'

class Top < SitePrism::Page
  set_url '/ja/'

  section :nav, Nav
end