class Room < ApplicationRecord
    validates_uniqueness_of :name
    scope :public_rooms, -> { where(is_private: false) }
    after_create_commit { broadcast_append_to "rooms" }
end

class User < ApplicationRecord
    validates_uniqueness_of :username
    scope :all_except, ->(user) { where.not(id: user) }
    after_create_commit { broadcast_append_to "users" }
end
