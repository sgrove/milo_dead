class Phrase < ActiveRecord::Base
  has_many :translations
  belongs_to :language

  def to_s
    return self.phrase
  end
end
