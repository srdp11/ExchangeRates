every 1.minute do
  runner 'FetchDataWorker.run'
  puts 'test sched'
end