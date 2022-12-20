class OrderItem < ApplicationRecord

  enum production_status: {cannot_be_manufactured: 0, waiting_for_production: 1, in_production: 2, finished: 3}
end
