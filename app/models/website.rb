class Website < ApplicationRecord

  STATUS = ['PENDING', 'UNDER-PROCESS', 'FAILED', 'COMPLETED']

  validates :domain, presence: true,
                     uniqueness: true,
                     format: {
                      with: /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/,
                      message: 'Not a valid URL format'}
  validates :status, presence: true

  after_validation do
    self.key = URI.parse(domain).host
  end
end
