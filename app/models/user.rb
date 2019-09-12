class User < ApplicationRecord

  #attr_accessible :login

  has_one :card

end
