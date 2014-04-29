require_relative '../fight'

class TestBot < Cinch::Bot
  attr_accessor :database, :irc, :raw_log

  def initialize
    super
    @raw_log = []
  end

  def raw(command)
    raw_log << command
  end
end

class FakeDB
  def initialize
    @db = {}  
  end

  def get key
    @db[key]
  end

  def set key, value
    @db[key] = value
  end
end

class TestIRC 
  attr_reader :isupport
  def initialize
    @isupport = Cinch::ISupport.new
  end
end

class TestMessage < Cinch::Message
  def reply message ; end
end

def set_test_message(bot, raw, user = "Test!test@network.com")
  TestMessage.new(":#{user} #{raw}", bot)
end

def create_fake_bot
  bot = TestBot.new do |c|
    c.logger = Cinch::Logger::NullLogger.new
    c.database = FakeDB.new
    c.irc = TestIRC.new
    c.config 
  end
  bot
end
