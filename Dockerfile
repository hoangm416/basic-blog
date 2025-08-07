# Dockerfile cho Ruby on Rails Blog
FROM ruby:3.2.0

# Cài đặt dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

# Tạo thư mục làm việc
WORKDIR /app

# Copy Gemfile và Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Cài đặt gems
RUN bundle install

# Copy toàn bộ source code
COPY . .

# Tạo thư mục cho PID files
RUN mkdir -p tmp/pids

# Expose port 3000
EXPOSE 3000

# Script để khởi động ứng dụng
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Lệnh mặc định
CMD ["rails", "server", "-b", "0.0.0.0"]
