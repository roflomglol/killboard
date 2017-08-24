module Fetchers
  module Corp
    class KillmailsFetcher < CorpBaseFetcher
      self.path = '/corp/KillMails.xml.aspx'

      attr_reader :from_id, :row_count

      def initialize(from_id: nil, row_count: 25)
        @from_id   = from_id
        @row_count = row_count
      end

      private

      def params
        super.merge(
          fromID: from_id,
          rowCount: row_count
        )
      end
    end
  end
end
