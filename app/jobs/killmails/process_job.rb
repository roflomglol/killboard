module Killmails
  class ProcessJob < ApplicationJob
    queue_as :process

    def perform(json)
      Killmail.new(
        origin_id:
      )
    end
  end
end
