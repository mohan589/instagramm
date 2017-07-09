class Admin::SkillsController < ApplicationController

  before_action :set_skill, only: [:show, :edit, :edit, :destroy, :update]

  def index
    @skills = Admin::Skill.all
  end

  def show

  end

  def new
    @skill = Admin::Skill.new
  end

  def edit
  end

  def update
    if @skill.update_attributes(skill_params)
      redirect_to admin_skills_path, notice:'Skill updated Successfully'
    else
      render 'edit'
    end
  end

  def create
    @skill = Admin::Skill.new(skill_params)

    if @skill.save
      redirect_to @skill, notice: 'Skill created Successfully'
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def set_skill
    @skill = Admin::Skill.find(params[:id])
  end

  def skill_params
    params.fetch(:admin_skill, {}).permit :name
  end
end
