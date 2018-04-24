# rake ios[common/command/command]
describe 'common/command/command' do
  t 'command' do
    File.delete 'syslog.log'

    start_logs_broadcast
    sleep 5
    stop_logs_broadcast

    assert File.exist?('syslog.log')
    assert File.size?('syslog.log')
  end
end
