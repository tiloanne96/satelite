class Service < ApplicationRecord
    #version needs the following structure: 0.0.1
    #0 => release . 0 => change . 1 => status (alpha, beta, etc)

    validates :name, presence: true
    before_save :version_and_status

    def version_and_status
        items = version&.split(".")&.length
        result = status.present? && items&.eql?(3)

        errors.add(:base, "can't be updated cause version or status are wrong")
        throw(:abort) unless result
    end
end
