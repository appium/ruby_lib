# rake android[common/command/command]
describe 'common/command/command' do
  t 'command' do
    File.delete 'logcat.log' if File.exist? 'logcat.log'

    start_logs_broadcast
    sleep 5
    stop_logs_broadcast

    assert File.exist?('logcat.log')
    assert File.size?('logcat.log')
  end
end
