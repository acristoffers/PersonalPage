class StaticController < ApplicationController
  def index
    redirect_to about_url format: :html
  end

  def about
  end

  def pic
  end

  def countdown
  end

  def confirm
    require 'net/https'

    emails = {
      '0' => 'Álan',
      '1' => 'Heider',
      '2' => 'Hudson',
      '3' => 'Bruno',
      '4' => 'Mariana'
    }

    url = URI.parse('https://api.pushover.net/1/messages.json')
    req = Net::HTTP::Post.new(url.path)
    req.set_form_data(token: 'ao3kCaM5TYhgdz9ZivG2tqpoCUsS9c',
                      user: 'udRwY5jxtFMhYXdEaQyP2kcDfjpxR8',
                      message: "#{emails[params[:email]]} just checked...")
    res = Net::HTTP.new(url.host, url.port)
    res.use_ssl = true
    res.verify_mode = OpenSSL::SSL::VERIFY_PEER
    res.start { |http| http.request(req) }

    send_file 'public/img.jpg', type: 'image/jpg', disposition: 'inline'
  end
end
