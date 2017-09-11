module Builders
  class KillmailBuilder
    attr_accessor :killmail

    def initialize
      @killmail = Killmail.new
    end

    def self.build
      builder = new
      yield(builder)
      builder.killmail
    end

    def set_victim(victim)
      killmail.victim = victim
    end

    def set_attackers(attackers)
      killmail.attackers = attackers
    end
  end
end
