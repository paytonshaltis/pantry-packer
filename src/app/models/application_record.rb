# frozen_string_literal: true

# Parent class of all models
# Edit to add attributes and behaviors to all models
# TCNJ: You probably won't touch this
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
