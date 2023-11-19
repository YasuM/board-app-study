class BoardCommentsController < ApplicationController
    def create
        @board_comment = BoardComment.create(board_comment_params)
        @board = @board_comment.board
        if @board_comment.save
            redirect_to board_path(@board_comment.board)
        else
            @comments = BoardComment.where(board_id: @board.id).order("created_at desc")
            render "boards/show", status: :unprocessable_entity
        end
    end

    private
    def board_comment_params
        params.require(:board_comment).permit(:board_id, :comment)
    end
end