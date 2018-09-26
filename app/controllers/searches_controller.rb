class SearchesController < ApplicationController

    def index
        binding.pry
        @questions = params["questions"]["0"]["question"]
        binding.pry

    end
end
