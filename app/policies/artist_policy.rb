class ArtistPolicy < ApplicationPolicy 
  def update?
    user == record
  end
end