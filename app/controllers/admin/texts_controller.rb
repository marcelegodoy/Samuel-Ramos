module Admin
  class TextsController < BaseController
    before_action :set_text, only: %i[edit update]

    def show
      @text = Text.first
    end

    def edit;end

    def update
      @text.update(text_params)
      if @text.save
        redirect_to admin_text_path(@text), notice: 'Texto da sidebar editado com sucesso'
      else
        render :edit
      end
    end

    private

    def set_text
      @text = Text.find(params[:id])
    end

    def text_params
      params.require(:text).permit(:identifier, :content)
    end
  end
end
