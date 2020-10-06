class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to @board, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        redirect_to @board, notice: 'Board was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      redirect_to boards_url, notice: 'Board was successfully destroyed.'
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
