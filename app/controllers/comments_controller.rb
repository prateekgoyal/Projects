class CommentsController < ApplicationController

	before_filter :login_required, :except => :show

	def create
		@post = Post.find(params[:post_id])
		userid = session[:user_id]
		@user = User.find(userid)
		# @comment = @post.comments.create(params[:comment])
		@comment = @post.comments.new
		@comment.commenter = @user.name
		@comment.body = params[:comment][:body]
		@comment.post_id = @post.id
		@comment.user_id = userid
		respond_to do |format|
			if @comment.save
				format.html {redirect_to @post}
			else
				format.html {redirect_to post_path(@post), :notice => 'Incomplete fields'}
			end
		end

	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
end
