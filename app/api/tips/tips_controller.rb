class TipsController < ApplicationController

  def get_tip
    Tip.find(rand(Tip.count)).tip
  end

end