# frozen_string_literal: true

# Parent class for all application record`s model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
