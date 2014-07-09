class User < ActiveRecord::Base
  ROLES = %i(admin broadcast dj inactive blocked)
end
