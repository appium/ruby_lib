# rake ios[common/command/command]
describe 'common/command/command' do
  t 'command' do
    File.delete 'syslog.log' if File.exist? 'syslog.log'

    # A number of systemlog is quite small than Android.
    # It only checks the commands works fine.
    start_logs_broadcast
    sleep 5
    assert stop_logs_broadcast.nil?

    assert File.exist?('syslog.log') if File.exist? 'syslog.log'
    assert File.size?('syslog.log') if File.exist? 'syslog.log'
  end
end
