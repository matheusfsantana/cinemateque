require 'rails_helper'

describe 'Add actor' do
  it 'success' do
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
    login_as user

    visit root_path
    within('nav') do
      click_on 'Atores'
    end

    click_on 'Registrar Ator'
    fill_in 'Nome', with: 'Matheus Santana'
    select("13", :from => "actor_birth_date_3i")
    select("julho", :from => "actor_birth_date_2i")
    select("2019", :from => "actor_birth_date_1i")
    fill_in 'Nacionalidade', with: 'Brasileiro'
    click_on 'Registrar Ator'

    expect(page).to have_css 'h1', text: 'Atores'
    expect(page).to have_content 'Matheus Santana'
    expect(page).to have_content '13 de julho de 2019'
    expect(page).to have_content 'Brasileiro'
    expect(page).to have_content 'Ator registrado com sucesso.'
  end

  it 'fail' do
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
    login_as user

    visit root_path
    within('nav') do
      click_on 'Atores'
    end

    click_on 'Registrar Ator'
    fill_in 'Nome', with: ''
    click_on 'Registrar Ator'

    expect(page).to have_css 'h1', text: 'Registrar Ator'
    expect(page).to have_content 'Ator não foi registrado.'
  end
end