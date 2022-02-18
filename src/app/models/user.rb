# frozen_string_literal: true

# Represents a user of the web application
class User < ApplicationRecord
  # Devise is a premade system for managing logins
  # You don't need to do login yourself. It's done for you.
  # TCNJ: don't edit the login system.

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
