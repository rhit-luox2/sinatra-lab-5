# class User < ActiveRecord::Base
#   has_secure_password
# end

# NOTE: I created this stubbed file for you so that you have an immediate reminder that
#       you will be using has_secure_password INSTEAD OF trying to store passwords yourself!
#
class User < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true, uniqueness: true
  end
