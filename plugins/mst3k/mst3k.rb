require 'nokogiri'
require 'open-uri'

class Mst3k < Isis::Plugin::Base

  def respond_to_msg?(msg, speaker)
    msg.downcase == '!mst3k'
  end

  PAGES = %w{
    http://www.svamcentral.org/mst/quotes/a_c.htm
    http://www.svamcentral.org/mst/quotes/d_f.htm
    http://www.svamcentral.org/mst/quotes/g_h.htm
    http://www.svamcentral.org/mst/quotes/i_l.htm
    http://www.svamcentral.org/mst/quotes/m_p.htm
    http://www.svamcentral.org/mst/quotes/q_t.htm
    http://www.svamcentral.org/mst/quotes/u_w.htm
    http://www.svamcentral.org/mst/quotes/x_z.htm
  }

  private

  def response_html
    page = Nokogiri.HTML(open('http://www.imdb.com/title/tt0094517/quotes'))
    quote = page.css('#content-2-wide .list div.quote').to_a.sample
    "#{quote}"
  end
end
