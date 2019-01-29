require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    Character.all.collect do |character|
      "#{character.name} - #{character.show.name}"
    end
  end

  def say_that_thing_you_say
    Character.all.collect do |character|
      binding.pry
      "#{character.name} always says: #{character.catchphrase}"
  end
end
