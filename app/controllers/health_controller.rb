class HealthController < ApplicationController
  # Skip authentication for health checks
  skip_before_action :authenticate_user!, if: :devise_controller?
  
  def index
    # Basic health check
    begin
      # Check database connection
      ActiveRecord::Base.connection.execute('SELECT 1')
      
      # Check Redis connection (if using Redis)
      if defined?(Redis)
        redis = Redis.new(url: ENV['REDIS_URL'] || 'redis://localhost:6379')
        redis.ping
      end
      
      render json: {
        status: 'ok',
        timestamp: Time.current.iso8601,
        version: Rails.application.class.module_parent_name,
        environment: Rails.env
      }, status: :ok
      
    rescue => e
      render json: {
        status: 'error',
        error: e.message,
        timestamp: Time.current.iso8601
      }, status: :service_unavailable
    end
  end
end
