# Class design
# es_repository { 'my_backup ':
#   ensure            => present,
#   type    => 'fs',
#   settings     => { 'location' => '/data/snap'
#                     'compress' => true },
# }
# some test text
Puppet::Type.newtype(:es_repository) do

  @doc = 'Create ES repo'

  ensurable

  newparam(:name) do
    desc 'Name of the repo'
    isnamevar
  end

  newparam(:type) do
    newvalues('fs','url')
    default_to('fs')
  end

  newparam(:settings) do
    desc 'Size of volume in GB'
    validate do |value|
      raise ArgumentError, "%s is not a hash" % value unless value.is_a? Hash
    end
  end

  newparam(:ip) do
    desc 'IP of an elasticsearch host'
    default_to('127.0.0.1')
  end

  newparam(:port) do
    desc 'Port of elasticsearch'
    default_to('9200')
  end
end