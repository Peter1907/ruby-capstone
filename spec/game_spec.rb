require_relative '../game'

describe Game do
  context 'should create an instance of Game class' do
    game = Game.new('2010', true, '2019')

    it 'should take 3 parameters and retrun a Game object' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'should be archived if publish date is older than 10 years and last played is older than 2 years' do
      game.move_to_archive
      expect(game.archived).to eq(true)
    end
  end
end
