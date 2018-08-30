class NotesController < ApplicationController
  def index
    @notes = Note.order(created_at: :asc)
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)

    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  private 

    def note_params
      params.require(:note).permit(:title, :body)
    end


end
