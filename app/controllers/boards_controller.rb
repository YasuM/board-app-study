class BoardsController < ApplicationController
  def index
    @boards = Board.all.order("created_at desc")
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @board = Board.find(params[:id])
    @board_comment = BoardComment.new
    @comments = BoardComment.where(board_id: params[:id]).order("created_at desc")
  end

  private
  
  def board_params
    params.require(:board).permit(:title, :body)
  end

end
