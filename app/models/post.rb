class Post < ApplicationRecord
  belongs_to :user
  enum status: { draft: 0, published: 1 }

  validates :title, presence: true
  validates :status, inclusion: { in: Post.statuses.keys }

  has_rich_text :content

  def toggle_status!
    if draft?
      published!
    else
      draft!
    end
  end
end
