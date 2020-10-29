class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :week_jp, only: [:index, :show, :edit]
  before_action :Time_Now, only: [:index]

  # GET /lists
  # GET /lists.json
  def index
    @user = current_user
    @lists = current_user.lists.all.order(stu_week: :asc)
    select_lists = current_user.lists.where(stu_week: Date.today.wday).order(stu_time: :asc)
    @today_lists = select_lists.select { |select_list| select_list.stu_time.to_i > @T_NOW || select_list.stu_time.to_i == 0 }
    @list = List.new
    # binding.pry
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
  end

  # GET /lists/1/edit
  def edit
    # byebug
  if current_user.id == @list.user_id.to_i
  set_list
  else
  redirect_to lists_path
  end
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'リストが追加されました' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'リストが更新されました' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, alert: 'リストが削除されました' }
      format.json { head :no_content }
    end
  end

  def select_delete
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:subject, :content, :stu_week, :stu_time)
    end

    def week_jp
      @DAT_OF_WEEK = ["日", "月", "火", "水", "木", "金", "土"]
      @Time =  { "1030" => "N1", "1210" => "N2", "1440" => "N3", "1620" => "N4", "1800" => "N5", "1940" => "N6", "2120" => "N7", "2459" => "授業外" }
    end

    def Time_Now
      @T_NOW = Time.now.strftime('%H%M').to_i
    end
end
