feature 'testing forms in / directory' do
  scenario 'Allows you to enter your name' do
    visit('/')
    expect(page).to have_field('name')
  end

  scenario 'Has a day box for date' do
    visit('/')
    expect(page).to have_field('day')
  end

  scenario 'Has a month box for date' do
    visit('/')
    expect(page).to have_select('month')
  end
end