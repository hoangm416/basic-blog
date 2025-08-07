#!/bin/bash
set -e

# Xóa server PID file nếu tồn tại
if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

# Chờ database sẵn sàng
echo "Waiting for database..."
while ! pg_isready -h $DB_HOST -p 5432 -U $DB_USER
do
  echo "Waiting for database to be ready..."
  sleep 2
done

echo "Database is ready!"

# Chạy migrations
echo "Running database migrations..."
bundle exec rails db:create db:migrate

# Chạy seeds nếu database trống
echo "Checking if database needs seeding..."
if [ "$(bundle exec rails runner 'puts User.count')" = "0" ]; then
  echo "Seeding database..."
  bundle exec rails db:seed
fi

# Thực thi lệnh được truyền vào
exec "$@"
