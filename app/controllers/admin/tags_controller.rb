module Admin
  class TagsController < BaseController
    before_action :set_tag, only: %i[show edit update destroy]

    def index
      @tags = Tag.all
    end

    def show;end

    def new
      @tag = Tag.new
    end

    def create
      @tag = Tag.new(tag_params)
      if @tag.save
        redirect_to admin_tag_path(@tag), notice: 'Tag salva com sucesso'
      else
        render :show
      end
    end

    def edit;end

    def update
      @tag.update(tag_params)
      if @tag.save
        redirect_to admin_tag_path(@tag), notice: 'Tag editada com sucesso'
      else
        render :edit
      end
    end

    def destroy
      if @tag.destroy
        redirect_to admin_tags_path, notice: 'Tag deletada com sucesso'
      else
        render :index
      end
    end

    private

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
  end
end
