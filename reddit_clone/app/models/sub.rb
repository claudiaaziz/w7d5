class Sub < ApplicationRecord

    has_many :users,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User,
        inverse_of: :moderator,
        dependent: :destroy
end
