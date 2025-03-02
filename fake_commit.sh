#!/bin/bash

# Ngày bắt đầu commit (đầu năm 2024)
start_date="2024-01-01"

# Ngày kết thúc (cuối năm 2024)
end_date="2024-12-31"

# Lặp qua các ngày trong năm 2024
current_date="$start_date"

while [[ "$current_date" < "$end_date" ]]
do
  # Tạo commit vào ngày hiện tại
  echo "Fake commit on $current_date" >> fake_commit.log
  git add fake_commit.log

  # Thiết lập ngày commit
  GIT_COMMITTER_DATE="$current_date" git commit --date="$current_date" -m "Commit on $current_date"
  
  echo "✅ Created commit on $current_date"

  # Random khoảng cách commit (3 hoặc 4 ngày)
  random_days=$((RANDOM % 2 + 3))

  # Tính ngày tiếp theo
  current_date=$(date -I -d "$current_date + $random_days days")

done

# Đẩy commit lên GitHub
git push origin main
