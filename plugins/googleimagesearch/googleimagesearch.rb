require 'google-search'

class GoogleImageSearch < Isis::Plugin::Base

  def respond_to_msg?(msg, speaker)
    if msg.split[0] == '!image'
      @query = msg.split[1..-1].join(' ')
      return true
    else
      return false
    end
  end

  private

  def response_text
    img = Google::Search::Image.new(query: @query).to_a.sample
    "#{img.uri}"
  end
end
