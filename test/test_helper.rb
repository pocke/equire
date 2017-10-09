require 'open3'
require 'minitest'
require 'minitest/autorun'
require 'minitest-power_assert'

def ruby_require_e(code, lib: 'equire')
  sh! 'ruby', "-r#{lib}", '-e', code
end

def sh!(*cmd)
  Open3.capture3({'RUBYOPT' => nil}, *cmd).tap do |out, err, status|
    unless status.success?
      raise <<~MESSAGE
        #{cmd.join(" ")} exits with unexpected status #{status.exitstatus}
        STDOUT:
        #{out}
        STDERR:
        #{err}
      MESSAGE
    end
  end
end
