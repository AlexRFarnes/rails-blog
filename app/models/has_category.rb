# == Schema Information
#
# Table name: has_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  article_id  :bigint           not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_has_categories_on_article_id   (article_id)
#  index_has_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (category_id => categories.id)
#

class HasCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category
end
