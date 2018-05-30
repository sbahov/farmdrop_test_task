require_relative 'header_top_bar'

class Header < SitePrism::Section
  section :top_bar, HeaderTopBar, '.header-bar__top'
end
