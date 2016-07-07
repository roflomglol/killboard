class Killmail::Parser
  attr_reader :body

  def initialize(body)
    @body = body
  end

  def parse
    {
      killed_at: killed_at
    }
  end

  private

  def killed_at
    body[/^\d{4}.\d{2}.\d{2} \d{2}:\d{2}:\d{2}$/]
  end
end
