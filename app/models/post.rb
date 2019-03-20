class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: %w(Fiction Non-Fiction)
  validate :clickbait

  def clickbait

    if !self.title
      errors.add(:title, "must be clickbait")
    else
      phrases = ["Won\'t Believe", "Secret", "Top", "Guess"]
      phrases.each do |phrase|
        if self.title.include?(phrase)
          return
        end
      end
      errors.add(:title, "must be clickbait")
    end
  end

end
