feature 'countdown page' do
  scenario 'countdown page shows how many days till your birthday' do
    visit('/')
    fill_in(:name, with: 'Kane') 
    fill_in(:day, with: 28)
    page.select Date::MONTHNAMES[Date.today.month], from: 'month'
    click_button 'Go!'
    expect(page).to have_content "Your birthday will be in #{28 - Date.today.day} days, Kane"
  end
end
