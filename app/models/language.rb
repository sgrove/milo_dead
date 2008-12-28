class Language < ActiveRecord::Base
  has_many :phrases
  has_many :translations

  def to_s
    return self.description
  end
end
