require 'spec_helper'
require 'minitest/autorun'

describe Fight do
  before do
    @bot = create_fake_bot
    @fight = Fight.new @bot
  end

  it 'sets the FightRPG database object' do
    FightRPG.database.must_equal @bot.database
  end

  describe "User creation" do
    before do
      message = set_test_message(@bot, "PRIVMSG #coding hi")
      @fight.create(message)
    end

    it "sets the user level to 1" do
      @bot.database.get("user:Test:level").must_equal 1
    end

    it "generates the user's weapon within the first 5 weapons" do
      (0...5).must_include @bot.database.get("user:Test:weapon")
    end

    it "generates the user's armor within the first 5 armors" do
      (0...5).must_include @bot.database.get("user:Test:armor")
    end

    it "sets the experience to 0" do
      @bot.database.get("user:Test:exp").must_equal 0
    end
  end
end
