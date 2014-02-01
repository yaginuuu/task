# -*- encoding: utf-8 -*-
class TasktopsController < ApplicationController
	before_action :set_tasktop, only: [:show, :edit, :update, :destroy]

	# GET /tasktops
	# GET /tasktops.json
	def top
		#team_memberを作成
		@members = User.where(group: current_user.group)
		
		team_member = Array.new()
		team_member_id = Array.new()
		@members.each do |f|
			team_member.push(f.username)
			team_member_id.push(f.id)
		end

		#weight_listを作成
		weight_list = Array.new()
		sum = 0
		team_member_id.each do |f|
			sum = Tasktop.where(owner_id: f).pluck(:weight).inject(:+)
			weight_list.push(sum)
		end
		p weight_list
		
		#pieグラフのデータ作成
		notyet_task = (Tasktop.where(owner_id: current_user.id, finish: 0).pluck(:id)).length
		finishd_task = (Tasktop.where(owner_id: current_user.id, finish: 1).pluck(:id)).length
		p finishd_task
		p notyet_task
		taskdata = [['消化済タスク', finishd_task],['未消化タスク', notyet_task]]

		#グラフ描写
		@bar_graph = LazyHighCharts::HighChart.new('graph') do |f|
			f.title(text: 'タスク振り分け状況')
			f.xAxis(categories: team_member)
			f.series(name: 'タスク量(重みの合計)', data: weight_list, type: 'bar')
		end
		@pie_graph = LazyHighCharts::HighChart.new('graph') do |f|
			f.title(text: 'あなたのタスク状況')
			f.series(name: 'タスク', data: taskdata, type: 'pie')
		end
		
		#タスク消化率を計算
		mytask_weight = Tasktop.where(owner_id: current_user.id, finish: 1).pluck(:weight).inject(:+)
		teamtask_weight = Tasktop.where(group_id: current_user.group).pluck(:weight).inject(:+)
		p mytask_weight
		p teamtask_weight
		@mytask_digest = mytask_weight.to_f / teamtask_weight.to_f * 100
		@mytask_digest = 0 if mytask_weight == nil
		p @mytask_digest
		
	end

	def index
		@tasktops = Tasktop.where(group_id: current_user.group)
	end

	# GET /tasktops/1
	# GET /tasktops/1.json
	def show
	end

	# GET /tasktops/new
	def new
		@tasktop = Tasktop.new
	end

	# GET /tasktops/1/edit
	def edit
	end

	# POST /tasktops
	# POST /tasktops.json
	def create
		@tasktop = Tasktop.new(tasktop_params)

		respond_to do |format|
			if @tasktop.save
				format.html { redirect_to @tasktop, notice: 'Tasktop was successfully created.' }
				format.json { render action: 'show', status: :created, location: @tasktop }
			else
				format.html { render action: 'new' }
				format.json { render json: @tasktop.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /tasktops/1
	# PATCH/PUT /tasktops/1.json
	def update
		respond_to do |format|
			if @tasktop.update(tasktop_params)
				format.html { redirect_to @tasktop, notice: 'Tasktop was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @tasktop.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /tasktops/1
	# DELETE /tasktops/1.json
	def destroy
		@tasktop.destroy
		respond_to do |format|
			format.html { redirect_to tasktops_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_tasktop
		@tasktop = Tasktop.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def tasktop_params
		params.require(:tasktop).permit(:name, :weight, :owner_id, :user_id, :group_id, :finish)
	end
end
