class PostsController < ApplicationController
    before_action :set_post, only: %i[ edit update destroy ]

    # GET /posts or /posts.json
    def index
      @posts = current_author.posts
    end

    def show
      @post = Post.find(params[:id])
      @comments = @post.comments.order(created_at: :desc)
    end

    # GET /posts/new
    def new
      @post = current_author.posts.build
    end

    # GET /posts/1/edit
    def edit
      @paragraph = @post.elements.build(element_type: 'paragraph')
      @image = @post.elements.build(element_type: 'image')
    end

    # POST /posts or /posts.json
    def create
      @post = current_author.posts.build(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to edit_post_path(@post) }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to edit_post_path(@post) }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    end



    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = current_author.posts.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :description, :header_image)
      end
end

