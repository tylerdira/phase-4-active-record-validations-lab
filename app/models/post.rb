class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

    validate :clickbate

    @@titles = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    def clickbate
        if @@titles.none? {|char| char.match(title)}
            errors.add(:title, "its not clickbait")
        end
    end
end
