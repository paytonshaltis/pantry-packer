class Request < ApplicationRecord

    # Association for single user requests.
    belongs_to :user

end
