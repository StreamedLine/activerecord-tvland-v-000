class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def list_roles
    character = Character.find(self.id)
    show = Show.find(character.id)
    "#{character.name} - #{show.name}"
  end

end
