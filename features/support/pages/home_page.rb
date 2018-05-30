require_relative 'sections/header'

class HomePage < SitePrism::Page
  section :header, Header, '.header-bar'
end
