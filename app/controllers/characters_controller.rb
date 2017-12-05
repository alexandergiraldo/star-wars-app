class CharactersController < ApplicationController
  def show
    request = HTTParty.get(params[:id], query: {format: 'json'})
    @character = CharacterSerializer.new
    if request.success?
      @character.from_json(request.body)
    end
  end
end
