# frozen_string_literal: true

require 'equire/version'

# TODO: DRb has many modules. https://docs.ruby-lang.org/ja/latest/library/drb.html
# TODO: net/* https://docs.ruby-lang.org/ja/latest/library/index.html
# TODO: webrick/* https://docs.ruby-lang.org/ja/latest/library/webrick.html
# TODO: syslog/logger https://docs.ruby-lang.org/ja/latest/library/syslog=2flogger.html
# TODO: win32/registry https://docs.ruby-lang.org/ja/latest/library/win32=2fregistry.html
# TODO: win32/resolv https://docs.ruby-lang.org/ja/latest/library/win32=2fresolv.html
# TODO: fiddle https://docs.ruby-lang.org/ja/latest/library/fiddle.html
# TODO: racc/parser https://docs.ruby-lang.org/ja/latest/library/racc=2fparser.html
# TODO: rinda https://docs.ruby-lang.org/ja/latest/library/rinda=2frinda.html
# TODO: rubygems https://docs.ruby-lang.org/ja/latest/library/rubygems.html
# TODO: mkmf https://docs.ruby-lang.org/ja/latest/library/mkmf.html

module Equire
  SimpleModules = %i[
    PTY Readline Shell
    Kconv NKF
    DBM GDBM PStore SDBM
    Date
    Forwardable Singleton Benchmark
    Coverage IRB PP Rake RbConfig Tracer
    FileUtils Find Pathname Tempfile
    CSV JSON Psych RDoc REXML RSS YAML Zlib
    WeakRef
    Fcntl Open3 Scanf
    BigDecimal CMath Matrix Prime Set TSort
    CGI DRb IPAddr OpenSSL Resolv Socket URI WEBrick XMLRPC
    Digest ERB Ripper Shellwords StringIO
    Monitor Mutex_m Sync ThWait Timeout
    Etc Syslog
    WIN32OLE
    Abbrev Base64 Continuation Logger PrettyPrint SecureRandom
  ].freeze

  Table = {
    GetoptLong: 'getoptlong',
    OptionParser: 'optparse',
    Datetime: 'date',
    Delegator: 'delegate',
    SimpleDelegator: 'delegate',
    SingleForwardable: 'forwardable',
    Observable: 'observer',
    RakeFileUtils: 'rake',
    FileList: 'rake',
    BigMath: 'bigdecimal/math',
    Vector: 'matrix',
    SortedSet: 'set',
    OpenURI: 'open-uri',
    Addrinfo: 'socket',
    BasicSocket: 'socket',
    IPSocket: 'socket',
    TCPSocket: 'socket',
    SOCKSSocket: 'socket',
    TCPServer: 'socket',
    UDPSocket: 'socket',
    UNIXSocket: 'socket',
    UNIXServer: 'socket',
    StringScanner: 'strscan',
    MonitorMixin: 'monitor',
    Synchronizer: 'sync',
    Sync_m: 'sync',
    Synchronizer_m: 'sync',
    ThreadsWait: 'thwait',
    WIN32OLE_EVENT: 'win32ole',
    WIN32OLE_METHOD: 'win32ole',
    WIN32OLE_PARAM: 'win32ole',
    WIN32OLE_TYPE: 'win32ole',
    WIN32OLE_TYPELIB: 'win32ole',
    WIN32OLE_VARIABLE: 'win32ole',
    WIN32OLE_VARIANT: 'win32ole',
    Exception2MessageMapper: 'e2mmap',
    OpenStruct: 'ostruct'
  }.freeze

  InstanceMethods = [
    [IO, :expect, 'expect'],

    [IO, :cooked, 'io/console'],
    [IO, :cooked!, 'io/console'],
    [IO, :echo=, 'io/console'],
    [IO, :echo?, 'io/console'],
    [IO, :getch, 'io/console'],
    [IO, :iflush, 'io/console'],
    [IO, :ioflush, 'io/console'],
    [IO, :noecho, 'io/console'],
    [IO, :oflush, 'io/console'],
    [IO, :raw, 'io/console'],
    [IO, :raw!, 'io/console'],
    [IO, :winsize, 'io/console'],
    [IO, :winsize=, 'io/console'],

    [String, :iseuc, 'kconv'],
    [String, :isjis, 'kconv'],
    [String, :issjis, 'kconv'],
    [String, :isutf8, 'kconv'],
    [String, :kconv, 'kconv'],
    [String, :toeuc, 'kconv'],
    [String, :tojis, 'kconv'],
    [String, :tolocale, 'kconv'],
    [String, :tosjis, 'kconv'],
    [String, :toutf16, 'kconv'],
    [String, :toutf32, 'kconv'],
    [String, :toutf8, 'kconv'],

    [Time, :to_date, 'date'],
    [Time, :to_datetime, 'date'],
    [Time, :to_time, 'date'],

    [Time, :httpdate, 'time'],
    [Time, :iso8601, 'time'],
    [Time, :rfc2822, 'time'],

    [Binding, :irb, 'irb'],

    [Kernel, :pp, 'pp'],
    [Object, :pretty_inspect, 'pp'],
    [Object, :pretty_print, 'pp'],
    [Object, :pretty_print_cycle, 'pp'],
    [Object, :pretty_print_inspect, 'pp'],
    [Object, :pretty_print_instance_variables, 'pp'],

    [Kernel, :Pathname, 'pathname'],

    [Class, :json_creatable?, 'json'],
    [Kernel, :JSON, 'json'],
    [Kernel, :j, 'json'],
    [Kernel, :jj, 'json'],
    [Exception, :to_json, 'json'],
    [Range, :to_json, 'json'],
    [Regexp, :to_json, 'json'],
    [Struct, :to_json, 'json'],
    [Time, :to_json, 'json'],

    [Kernel, :psych_y, 'psych'],
    [Module, :psych_yaml_as, 'psych'],
    [Object, :psych_to_yaml, 'psych'],

    [IO, :nonblock, 'io/nonblock'],
    [IO, :nonblock=, 'io/nonblock'],
    [IO, :nonblock?, 'io/nonblock'],

    [IO, :nread, 'io/wait'],
    [IO, :ready?, 'io/wait'],
    [IO, :wait, 'io/wait'],
    [IO, :wait_writable, 'io/wait'],

    [IO, :scanf, 'scanf'],
    [Kernel, :scanf, 'scanf'],
    [String, :scanf, 'scanf'],

    [Kernel, :BigDecimal, 'bigdecimal'],

    [Integer, :prime?, 'prime'],
    [Integer, :prime_division, 'prime'],

    [Enumerable, :to_set, 'set'],

    [Integer, :to_bn, 'openssl'],

    [Kernel, :URI, 'uri'],

    [Kernel, :Digest, 'digest'],

    [Array, :shelljoin, 'shellwords'],
    [String, :shellescape, 'shellwords'],
    [String, :shellsplit, 'shellwords'],

    [Kernel, :timeout, 'timeout'],

    [IO, :pathconf, 'etc'],

    [Array, :abbrev, 'abbrev'],

    [Kernel, :callcc, 'continuation'],

    [Fiber, :alive?, 'fiber'],
    [Fiber, :transfer, 'fiber'],

    [ObjectSpace, :count_nodes, 'objspace'],
    [ObjectSpace, :count_objects_size, 'objspace'],
    [ObjectSpace, :count_tdata_objects, 'objspace'],
    [ObjectSpace, :memsize_of, 'objspace'],
    [ObjectSpace, :memsize_of_all, 'objspace'],
    [ObjectSpace, :reachable_objects_from, 'objspace']
  ].freeze

  ClassMethods = [
    [IO, :console, 'io/console'],

    [Time, :httpdate, 'time'],
    [Time, :iso8601, 'time'],
    [Time, :parse, 'time'],
    [Time, :rfc2822, 'time'],
    [Time, :strptime, 'time'],

    [Kernel, :pp, 'pp'],

    [Dir, :mktmpdir, 'tmpdir'],
    [Dir, :tmpdir, 'tmpdir'],

    [Exception, :json_create, 'json'],
    [Range, :json_create, 'json'],
    [Regexp, :json_create, 'json'],
    [Struct, :json_create, 'json'],
    [Time, :json_create, 'json'],

    [Object, :yaml_tag, 'psych'],

    [Kernel, :BigDecimal, 'bigdecimal'],

    [Integer, :each_prime, 'prime'],
    [Integer, :from_prime_division, 'prime'],

    [Kernel, :URI, 'uri'],

    [Fiber, :current, 'fiber'],

    [ObjectSpace, :count_nodes, 'objspace'],
    [ObjectSpace, :count_objects_size, 'objspace'],
    [ObjectSpace, :count_tdata_objects, 'objspace'],
    [ObjectSpace, :memsize_of, 'objspace'],
    [ObjectSpace, :memsize_of_all, 'objspace'],
    [ObjectSpace, :reachable_objects_from, 'objspace']
  ].freeze

  InstanceMethods.each do |klass, method, library|
    eval <<~RUBY
      #{klass.is_a?(Class) ? 'class' : 'module'} ::#{klass}
        def #{method}(*args)
          undef #{method}
          require #{library.inspect}
          __send__(#{method.inspect}, *args)
        end
      end
    RUBY
  end

  ClassMethods.each do |klass, method, library|
    eval <<~RUBY
      #{klass.is_a?(Class) ? 'class' : 'module'} ::#{klass}
        def self.#{method}(*args)
          class << #{klass}
            undef #{method}
          end
          require #{library.inspect}
          __send__(#{method.inspect}, *args)
        end
      end
    RUBY
  end
end

Equire::SimpleModules.each do |mod|
  autoload mod, mod.to_s.downcase
end

Equire::Table.each do |mod, name|
  autoload mod, name
end
