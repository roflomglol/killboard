module Builders
  class PilotBuilder
    attr_reader :pilot

    def initialize
      @pilot = Pilot.new
    end

    def self.build
      builder = new
      yield(builder)
      builder.pilot
    end

    def set_name(name)
      pilot.name = name
    end

    def set_origin_id(origin_id)
      pilot.origin_id = origin_id
    end
  end
end
