class User < ApplicationRecord
    has_one :zoo

    has_secure_password
end
