feature 'birthday page' do
  scenario 'Happy birthday if today is your birthday' do
    visit('/')
    fill_in(:name, with: 'Kane')
    fill_in(:day, with: '9')
    page.select 'October', from: 'month'
    click_button 'Go!'
    expect(page).to have_content 'Happy Birthday Kane!'
  end
end