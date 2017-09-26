require "auto_require/version"

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

module AutoRequire
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
  ]

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
    OpenStruct: 'ostruct',
  }.freeze

  def Object.const_missing(name)
    case
    when SimpleModules.include?(name)
      name = name.to_s
      require name.downcase
      eval name
    when lib = Table[name]
      require lib
      eval name.to_s
    else
      super
    end
  end
end
