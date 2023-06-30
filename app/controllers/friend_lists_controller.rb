class FriendListsController < ApplicationController
  before_action :set_friend_list, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /friend_lists or /friend_lists.json
  def index
    @friend_lists = FriendList.all
  end

  # GET /friend_lists/1 or /friend_lists/1.json
  def show
  end

  # GET /friend_lists/new
  def new
    @friend_list = FriendList.new
    #@friend_list = current_user.friends.build
  end

  # GET /friend_lists/1/edit
  def edit
  end

  # POST /friend_lists or /friend_lists.json
  def create
    @friend_list = FriendList.new(friend_list_params)
    #@friend_list = current_user.friends.build (friend_list_params)

    respond_to do |format|
      if @friend_list.save
        format.html { redirect_to friend_list_url(@friend_list), notice: "Friend list was successfully created." }
        format.json { render :show, status: :created, location: @friend_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_lists/1 or /friend_lists/1.json
  def update
    respond_to do |format|
      if @friend_list.update(friend_list_params)
        format.html { redirect_to friend_list_url(@friend_list), notice: "Friend list was successfully updated." }
        format.json { render :show, status: :ok, location: @friend_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_lists/1 or /friend_lists/1.json
  def destroy
    @friend_list.destroy

    respond_to do |format|
      format.html { redirect_to friend_lists_url, notice: "Friend list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend_list = current_user.friends.find_by(id: params[:id])
    redirect_to friend_lists_path, notice: "not authorized to edit this friend" if @friend_list.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_list
      @friend_list = FriendList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_list_params
      params.require(:friend_list).permit(:first_name, :last_name, :email, :phone, :insta, :user_id)
    end
end
