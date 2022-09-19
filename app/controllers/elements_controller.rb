class ElementsController < ApplicationController
  before_action :set_post
  before_action :set_element, only: %i[ edit update destroy ]


  def set_post
    @post = current_author.posts.find(params[:post_id])
  end

  # POST /elements or /elements.json
  def create
    @element = @post.elements.build(element_params)

    if @element.save
      notice = nil
    else
      notice = redirect_to edit_post_path(@post), notice: @post.errors.full_messages.join(",")
    end
    
    redirect_to edit_post_path(@post), notice: notice
  end

  def edit
    @paragraph = @post.elements.build(element_type: 'paragraph')
  end

  # PATCH/PUT /elements/1 or /elements/1.json
  def update
    @element.update(element_params)
    redirect_to edit_post_path(@element.post)
  end

  # DELETE /elements/1 or /elements/1.json
  def destroy
    @element.destroy
    redirect_to edit_post_path(@element.post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = Element.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def element_params
      params.require(:element).permit(:element_type, :content, :image)
    end
end
