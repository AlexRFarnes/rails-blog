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
end
