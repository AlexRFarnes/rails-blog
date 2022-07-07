# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  status     :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
    has_rich_text :content
end
