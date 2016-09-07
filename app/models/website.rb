class Website < ApplicationRecord

  STATUS = ['PENDING', 'UNDER-PROCESS', 'FAILED', 'COMPLETED']
  TAGS   = ["h1","h2","h3","a"]

  validates :domain, presence: true,
                     uniqueness: true,
                     format: {
                      with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/,
                      message: 'Not a valid URL format'}
  validates :status, presence: true

  before_create do
    self.key = Digest::MD5.hexdigest("#{self.domain}-#{Date.current}")
  end
end
