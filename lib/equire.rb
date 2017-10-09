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

  InstanceMethods = {
    'expect' => [
      [IO, :expect]
    ],
    'io/console' => [
      [IO, :cooked],
      [IO, :cooked!],
      [IO, :echo=],
      [IO, :echo?],
      [IO, :getch],
      [IO, :iflush],
      [IO, :ioflush],
      [IO, :noecho],
      [IO, :oflush],
      [IO, :raw],
      [IO, :raw!],
      [IO, :winsize],
      [IO, :winsize=]
    ],
    'kconv' => [
      [String, :iseuc],
      [String, :isjis],
      [String, :issjis],
      [String, :isutf8],
      [String, :kconv],
      [String, :toeuc],
      [String, :tojis],
      [String, :tolocale],
      [String, :tosjis],
      [String, :toutf16],
      [String, :toutf32],
      [String, :toutf8]
    ],
    'date' => [
      [Time, :to_date],
      [Time, :to_datetime],
      [Time, :to_time]
    ],
    'time' => [
      [Time, :httpdate],
      [Time, :iso8601],
      [Time, :rfc2822]
    ],
    'irb' => [
      [Binding, :irb]
    ],
    'pp' => [
      [Kernel, :pp],
      [Object, :pretty_inspect],
      [Object, :pretty_print],
      [Object, :pretty_print_cycle],
      [Object, :pretty_print_inspect],
      [Object, :pretty_print_instance_variables]
    ],
    'pathname' => [
      [Kernel, :Pathname]
    ],
    'json' => [
      [Class, :json_creatable?],
      [Kernel, :JSON],
      [Kernel, :j],
      [Kernel, :jj],
      [Exception, :to_json],
      [Range, :to_json],
      [Regexp, :to_json],
      [Struct, :to_json],
      [Time, :to_json]
    ],
    'psych' => [
      [Kernel, :psych_y],
      [Module, :psych_yaml_as],
      [Object, :psych_to_yaml]
    ],
    'io/nonblock' => [
      [IO, :nonblock],
      [IO, :nonblock=],
      [IO, :nonblock?]
    ],
    'io/wait' => [
      [IO, :nread],
      [IO, :ready?],
      [IO, :wait],
      [IO, :wait_writable]
    ],
    'scanf' => [
      [IO, :scanf],
      [Kernel, :scanf],
      [String, :scanf]
    ],
    'bigdecimal' => [
      [Kernel, :BigDecimal]
    ],
    'prime' => [
      [Integer, :prime?],
      [Integer, :prime_division]
    ],
    'set' => [
      [Enumerable, :to_set]
    ],
    'openssl' => [
      [Integer, :to_bn]
    ],
    'uri' => [
      [Kernel, :URI]
    ],
    'digest' => [
      [Kernel, :Digest]
    ],
    'shellwords' => [
      [Array, :shelljoin],
      [String, :shellescape],
      [String, :shellsplit]
    ],
    'timeout' => [
      [Kernel, :timeout]
    ],
    'etc' => [
      [IO, :pathconf]
    ],
    'abbrev' => [
      [Array, :abbrev]
    ],
    'continuation' => [
      [Kernel, :callcc]
    ],
    'fiber' => [
      [Fiber, :alive?],
      [Fiber, :transfer]
    ],
    'objspace' => [
      [ObjectSpace, :count_nodes],
      [ObjectSpace, :count_objects_size],
      [ObjectSpace, :count_tdata_objects],
      [ObjectSpace, :memsize_of],
      [ObjectSpace, :memsize_of_all],
      [ObjectSpace, :reachable_objects_from]
    ]
  }.freeze

  ClassMethods = {
    'io/console' => [
      [IO, :console]
    ],
    'time' => [
      [Time, :httpdate],
      [Time, :iso8601],
      [Time, :parse],
      [Time, :rfc2822],
      [Time, :strptime]
    ],
    'pp' => [
      [Kernel, :pp]
    ],
    'tmpdir' => [
      [Dir, :mktmpdir],
      [Dir, :tmpdir]
    ],
    'json' => [
      [Exception, :json_create],
      [Range, :json_create],
      [Regexp, :json_create],
      [Struct, :json_create],
      [Time, :json_create]
    ],
    'psych' => [
      [Object, :yaml_tag]
    ],
    'bigdecimal' => [
      [Kernel, :BigDecimal]
    ],
    'prime' => [
      [Integer, :each_prime],
      [Integer, :from_prime_division]
    ],
    'uri' => [
      [Kernel, :URI]
    ],
    'fiber' => [
      [Fiber, :current]
    ],
    'objspace' => [
      [ObjectSpace, :count_nodes],
      [ObjectSpace, :count_objects_size],
      [ObjectSpace, :count_tdata_objects],
      [ObjectSpace, :memsize_of],
      [ObjectSpace, :memsize_of_all],
      [ObjectSpace, :reachable_objects_from]
    ]
  }.freeze

  InstanceMethods.each do |library, methods|
    methods.each do |klass, method|
      eval <<~RUBY
        #{klass.is_a?(Class) ? 'class' : 'module'} ::#{klass}
          def #{method}(*args)
            #{methods.map do |_klass, m|
              "undef #{m}"
            end.join("\n")}
            class << #{klass}
              #{Array(ClassMethods[library]).map do |_klass, m|
                "undef #{m}"
              end.join("\n")}
            end
            require #{library.inspect}
            __send__(#{method.inspect}, *args)
          end
        end
      RUBY
    end
  end

  ClassMethods.each do |library, methods|
    methods.each do |klass, method|
      eval <<~RUBY
        #{klass.is_a?(Class) ? 'class' : 'module'} ::#{klass}
          def self.#{method}(*args)
            #{Array(InstanceMethods[library]).map do |_klass, m|
              "undef #{m}"
            end.join("\n")}
            class << #{klass}
              #{methods.map do |_klass, m|
                "undef #{m}"
              end.join("\n")}
            end
            require #{library.inspect}
            __send__(#{method.inspect}, *args)
          end
        end
      RUBY
    end
  end
end

Equire::SimpleModules.each do |mod|
  autoload mod, mod.to_s.downcase
end

Equire::Table.each do |mod, name|
  autoload mod, name
end
