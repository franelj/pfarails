class StaticPagesController < ApplicationController
  def home
    @stats = {
        downloads: 150,
        challenges: 0,
        points: User.sum(:points),
        players: User.count
    }
  end
end
