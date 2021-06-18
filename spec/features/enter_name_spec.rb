

# As a marketeer
# So that I can see my name in lights
# I would like to register my name before playing an online game

feature 'user can register their name' do
  let(:name) { double("name") }
  scenario 'the user can submit and return their name' do
    start_single_player_game(name)
    expect(page).to have_content name
  end
end

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors
