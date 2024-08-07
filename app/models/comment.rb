class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  after_initialize :set_default_status, if: :new_record?
  
  private
  def set_default_status
    self.status ||= 'public'  # Default to 'public' or any other status you prefer
  end
end
