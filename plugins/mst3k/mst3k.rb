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

  def response_text
    page = Nokogiri.HTML(open(PAGES.sample))
    quote = page.css('p')[1..-1].to_a.sample.text
    "#{quote}"
  end
end
