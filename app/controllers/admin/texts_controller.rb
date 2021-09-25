module Admin
  class TextsController < BaseController
    before_action :set_text, only: %i[show create edit update destroy]

    def index
      @texts = Text.all
    end

    def show;end

    def new
      @text = Text.new
    end

    def create
      @text = Text.new(text_params)
      if @text.save
        redirect_to admin_text_path(@text), notice: 'Texto salvo com sucesso'
      else
        render :show
      end
    end

    def edit;end

    def update
      @text.update(text_params)
      if @text.save
        redirect_to admin_text_path(@text), notice: 'Texto editado com sucesso'
      else
        render :edit
      end
    end

    def destroy
      if @text.destroy
        redirect_to admin_texts_path, notice: 'Texto deletado com sucesso'
      else
        render :index
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
