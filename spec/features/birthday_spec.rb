feature 'birthday page' do
  scenario 'Happy birthday if today is your birthday' do
    visit('/')
    fill_in(:name, with: 'Kane')
    fill_in(:day, with: Date.today.day)
    page.select Date::MONTHNAMES[Date.today.month], from: 'month'
    click_button 'Go!'
    expect(page).to have_content 'Happy Birthday Kane!'
  end

  #scenario to have button which returns you to /
  scenario 'Button to return you to home page' do
    visit('/')
    fill_in(:name, with: 'Kane')
    fill_in(:day, with: Date.today.day)
    page.select Date::MONTHNAMES[Date.today.month], from: 'month'
    click_button 'Go!'
    click_button 'Return to home page'
    expect(page).to have_content 'Hello there!'
  end

end