class Category < ApplicationRecord
  acts_as_taggable_on :ideas
end
