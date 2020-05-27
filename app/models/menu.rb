# == Schema Information
#
# Table name: menus
#
#  id         :bigint           not null, primary key
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :string
#
class Menu < ApplicationRecord
    validates :title, presence: true
    before_save do 
        self.slug = url_title if self.slug.empty?
    end
    
    private

    def url_title
        title.parameterize
    end
end
