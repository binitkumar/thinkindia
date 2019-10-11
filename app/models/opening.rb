class Opening < ApplicationRecord
  has_many :application_forms

  def job_status
    if self.is_open
      "Open"
    else
      "Closed"
    end
  end
end
