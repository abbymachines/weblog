class TopicsController < ApplicationController
  before_action :set_topic, only: %i[ show update destroy ]

  def test
    puts 'this is a test'
  end

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
    render json: @topics
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    # binding.pry
    # @topic = Topic.find(topic_params[:id])
    render json: @topic
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render :show, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    if @topic.update(topic_params)
      render :show, status: :ok, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def topic_params
      params.fetch(:topic, {})
    end
end
