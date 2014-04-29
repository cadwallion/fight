require 'spec_helper'
require 'minitest/autorun'

describe FightRPG::User do
  before do
    FightRPG.set_database FakeDB.new
    @user = FightRPG::User.create 'Test'
  end

  it 'has an armor' do
    @user.armor = 1
    @user.armor.must_equal Fight::ARMOR[1][1]
  end

  it 'has a weapon' do
    @user.weapon = 1
    @user.weapon.must_equal Fight::WEAPONS[1][1]
  end
end

