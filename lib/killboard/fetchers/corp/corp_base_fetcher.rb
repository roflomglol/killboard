module Fetchers
  module Corp
    class CorpBaseFetcher < BaseFetcher
      private

      def params
        {
          keyID: ENV.fetch('EVE_API_CORP_KEY_ID'),
          vCode: ENV.fetch('EVE_API_CORP_V_CODE')
        }
      end
    end
  end
end
