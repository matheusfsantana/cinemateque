require 'rails_helper'

describe 'Add role to actor ' do
  it 'success' do
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
    movie = FactoryBot.create(:movie, title: 'Werewolf', year: 1900)
    actor = Actor.create!(name: "Matheus", birth_date: Date.today, nacionality: 'Brasileiro')
    login_as user

    visit root_path
    within('nav') do
      click_on 'Atores'
    end
    click_on 'Matheus'
    click_on 'Registrar Papel'
    fill_in 'Papel', with: 'Lobisomem'
    select 'Werewolf', from: 'Filme'
    click_on 'Registrar Papel'

    expect(page).to have_css 'h2', text: 'Papéis'
    expect(page).to have_content 'Werewolf'
    expect(page).to have_content 'Lobisomem'
    expect(page).to have_content 'Papel registrado com sucesso.'
  end

  it 'fail' do
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
    movie = FactoryBot.create(:movie, title: 'Werewolf', year: 1900)
    actor = Actor.create!(name: "Matheus", birth_date: Date.today, nacionality: 'Brasileiro')
    login_as user

    visit root_path
    within('nav') do
      click_on 'Atores'
    end
    click_on 'Matheus'
    click_on 'Registrar Papel'
    fill_in 'Papel', with: ''
    click_on 'Registrar Papel'

    expect(page).to have_content 'Papel não foi registrado.'
  end
end