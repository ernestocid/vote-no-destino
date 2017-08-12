class HomeController < ApplicationController
  def index
    @overall_results = VoteChecker.compute_all_votes
  end
end
