# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  status     :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           default(1), not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user # additional field
    has_many :has_categories
    has_many :categories, through: :has_categories
    attr_accessor :category_elements

    def save_categories
        # categories_array = category_elements.split(",")
        category_elements.each do |category_id|
        # unless HasCategory.where(article: self, category_id: category_id).any?
        #     HasCategory.create(article: self, category_id: category_id)
        # end
        # Mejor manera de hacer lo anterior
        HasCategory.find_or_create_by(article: self, category_id: category_id)
        end
    end

end
