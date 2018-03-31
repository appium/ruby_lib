# rake android[common/command/command]
describe 'common/command/command' do
  # rubocop:disable Lint/UnifiedInteger
  t 'commands' do
    start_logs_broadcast

    stop_logs_broadcast
  end
end
