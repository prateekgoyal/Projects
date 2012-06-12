
class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json

  before_filter :login_required, :only=>['comment', 'edit', 'create', 'update', 'destroy']
  def index
    @posts = Post.all
    userid = current_user
    if userid
    @user = User.find(userid)
  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    
    #@post = Post.new(params[:post])
    @post = Post.new
    userid = current_user
    @user = User.find(userid)
    @post.name = @user.name
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.user_id = userid

    respond_to do |format|
      if @post.save
        format.html { redirect_to welcome_user_path(:notice => 'Post was successfully created.', :id => userid) }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def comment
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html {redirect_to :controller => "posts", :action => "show", :id => @post.id}
    end
  end
end
