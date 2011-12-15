
##
# Archive Job
archive_job = lambda do |archive|
  archive.add     File.expand_path('../../../lib/backup', __FILE__)
  archive.exclude File.expand_path('../../../lib/backup/storage', __FILE__)
end

##
# Configuration

Backup::Configuration::Storage::Local.defaults do |storage|
  storage.path = Backup::SpecLive::TMP_PATH
  storage.keep = 2
end

# SSH operations can be tested against 'localhost'
# To do this, in the config.yml file:
# - set username/password for your current user
# - set ip to 'localhost'
# Although optional, it's recommended you set the 'path'
# to the same path as Backup::SpecLive::TMP_PATH
# i.e. '/absolute/path/to/spec-live/tmp'
# This way, cleaning the "remote path" can be skipped.
Backup::Configuration::Storage::SCP.defaults do |storage|
  storage.username = SpecLive::CONFIG['storage']['scp']['username']
  storage.password = SpecLive::CONFIG['storage']['scp']['password']
  storage.ip       = SpecLive::CONFIG['storage']['scp']['ip']
  storage.port     = SpecLive::CONFIG['storage']['scp']['port']
  storage.path     = SpecLive::CONFIG['storage']['scp']['path']
  storage.keep     = 2
end

##
# Models

Backup::Model.new(:archive_local, 'test_label') do |model|
  archive :test_archive, &archive_job
  store_with Local
end

Backup::Model.new(:archive_scp, 'test_label') do |model|
  archive :test_archive, &archive_job
  store_with SCP
end
