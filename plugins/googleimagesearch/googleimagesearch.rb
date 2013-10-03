require 'google-search'

class GoogleImageSearch < Isis::Plugin::Base

  def respond_to_msg?(msg, speaker)
    msg.split[0] == '!image'
    @query = msg.split[1..-1].join(' ')
  end

  private

  def response_text
    img = Google::Search::Image.new(query: @query).to_a.sample
    "#{img}"
  end
end
