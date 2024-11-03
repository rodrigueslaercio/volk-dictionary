class FavoriteWordsController < ApplicationController
  def create 
    @logged_user = logged_in_user
    @favorite_word = FavoriteWord.new(user_id: @logged_user.id, word: params[:input_text])

    if @favorite_word.save 
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream
      end
    else 
    end 
  end

  def destroy 
    @favorite_word = FavoriteWord.find(params[:id])
    @favorite_word.destroy 

    respond_to do |format| 
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

end
