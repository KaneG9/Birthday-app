feature 'Shows error page if invalid date is entered' do
  scenario '31st feb entered into birthday' do
    visit('/')
    fill_in(:name, with: 'Kane') 
    fill_in(:day, with: 31)
    page.select 'February', from: 'month'
    click_button 'Go!'
    expect(page).to have_content "Invalid birthday"
  end

  scenario 'Error button navigates back to home' do
    visit('/')
    fill_in(:name, with: 'Kane') 
    fill_in(:day, with: 31)
    page.select 'February', from: 'month'
    click_button 'Go!'
    click_button 'Back'
    expect(page).to have_content 'Hello there!'
  end
end