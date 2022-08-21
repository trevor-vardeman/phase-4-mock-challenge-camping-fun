class SignupsController < ApplicationController
  attributes :id, :name, :age

  belongs_to :camper
  belongs_to :activity
end