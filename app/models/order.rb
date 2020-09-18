class Order < ApplicationRecord
  enum pay_type: {
  "Check" => 0,
  "Credit card" => 1,
  "Pur chase or der" => 2
  }
end
