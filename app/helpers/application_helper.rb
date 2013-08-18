require 'digest/md5'
module ApplicationHelper

  def gravatar_image(email)
    email_hash = hashed_email(email)
    raw("<img src=\"http://www.gravatar.com/avatar/#{email_hash}.jpg\"/>")
  end
  def hashed_email(email)
    email = email.strip.downcase
    Digest::MD5.hexdigest(email)
  end
end 
