# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.where(email: 'admin@iqvoc').none?
  User.create! do |user|
    user.forename = 'Admin'
    user.surname  = 'Istrator'
    user.email    = 'admin@iqvoc'
    user.password = 'admin'
    user.password_confirmation = 'admin'
    user.active = true
    user.role = 'administrator'
  end
end

if User.where(email: 'demo@iqvoc').none?
  User.create! do |user|
    user.forename = 'Demo'
    user.surname  = 'User'
    user.email    = 'demo@iqvoc'
    user.password = 'cooluri'
    user.password_confirmation = 'cooluri'
    user.active = true
    user.role = 'reader'
  end
end

ConfigurationSetting.create(key: 'title', value: '"Cedar"')
ConfigurationSetting.create(key: 'site_url', value: '"http://localhost:8888/"')
ConfigurationSetting.create(key: 'languages.pref_labeling', value: ["en"])
ConfigurationSetting.create(key: 'languages.further_labelings.Labeling::SKOS::AltLabel', value: ["en"])
ConfigurationSetting.create(key: 'languages.notes', value: ["en"])
ConfigurationSetting.create(key: 'performance.unbounded_hierarchy', value: 'false')
ConfigurationSetting.create(key: 'sources.iqvoc', value: [""])
ConfigurationSetting.create(key: 'triplestore.url', value: '"http://example.org:8080"')
ConfigurationSetting.create(key: 'triplestore.username', value: '""')
ConfigurationSetting.create(key: 'triplestore.password', value: '""')
ConfigurationSetting.create(key: 'triplestore.autosync', value: 'false')
ConfigurationSetting.create(key: 'minter.base_url', value: '"http://id.localhost:8888/"')
ConfigurationSetting.create(key: 'minter.api_endpoint', value: '"http://id.localhost/api/v1/"')
ConfigurationSetting.create(key: 'minter.api_key', value: '"1234"')
ConfigurationSetting.create(key: 'minter.prefix', value: '"au"')
ConfigurationSetting.create(key: 'minter.erc_who', value: '"Cedar Vagrant"')
