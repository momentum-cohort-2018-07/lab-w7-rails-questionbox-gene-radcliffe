class Answer < ApplicationRecord
    belongs_to :answerable, polymorphic: true
    belongs_to :user
    #has_many :answers, as: :answerable
end
