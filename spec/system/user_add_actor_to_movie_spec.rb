require 'rails_helper'

describe 'Add actor to movie ' do
  it 'success' do
    movie_theater = FactoryBot.create(:movie_theater, name: 'Cine Paradiso')
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
    expect(page).to have_content '12/09/2000'
    expect(page).to have_content 'Brasileiro'
    expect(page).to have_content 'Ator registrado com sucesso.'
  end
end