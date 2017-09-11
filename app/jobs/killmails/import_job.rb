module Killmails
  class ImportJob < ApplicationJob
    queue_as :import

    attr_accessor :killmails

    def perform
      fetch_killmails
      parse_killmails
      enqueue_killmails
    end

    private

    def fetch_killmails
      self.killmails = Fetchers::Corp::KillmailsFetcher.new(from_id: last_killmail_origin_id, row_count: 2).call.xml
    end

    def last_killmail_origin_id
      Killmail.last_origin_id
    end

    def parse_killmails
      self.killmails = Parsers::XML::KillmailsParser.new(killmails).call
    end

    def enqueue_killmails
      killmails.each do |killmail|
        ProcessJob.perform_later(killmail)
      end
    end
  end
end
