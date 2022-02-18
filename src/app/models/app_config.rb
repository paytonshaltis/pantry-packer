# frozen_string_literal: true

# global app configuration model

# Fields:
# - name: string
# - logo_url: string
class AppConfig < ApplicationRecord
  # make sure all fields exist
  validates :name, :logo_url, presence: true

  # make sure app name isn't empty
  # logo can be empty. That's not a big teal tbh.
  validates_length_of :name, minimum: 1
end
