Then(/^I see (.*) text in top header$/) do |text|
  @home = HomePage.new
  expect(@home.header.top_bar.wait_for_lable_account(10, text: /#{text}/)).to eq(true), "There is no '#{text}' text in top bar header"
end
