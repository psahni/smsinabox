# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{smsinabox}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["kenneth.kalmer@gmail.com"]
  s.date = %q{2010-06-18}
  s.description = %q{Ruby API for sending text messages via http://www.smsinabox.co.za}
  s.email = %q{kenneth.kalmer@gmail.com}
  s.executables = ["sms-credit", "sms-send", "sms-setup"]
  s.extra_rdoc_files = [
    "History.txt",
     "PostInstall.txt",
     "README.rdoc",
     "TODO.txt"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "PostInstall.txt",
     "README.rdoc",
     "Rakefile",
     "TODO.txt",
     "bin/sms-credit",
     "bin/sms-send",
     "bin/sms-setup",
     "lib/smsinabox.rb",
     "lib/smsinabox/configuration.rb",
     "lib/smsinabox/delivery_report.rb",
     "lib/smsinabox/exceptions.rb",
     "lib/smsinabox/message.rb",
     "lib/smsinabox/reply.rb",
     "lib/smsinabox/sent_message.rb",
     "lib/smsinabox/sms.rb",
     "script/console",
     "script/destroy",
     "script/generate",
     "smsinabox.gemspec",
     "spec/delivery_report_spec.rb",
     "spec/fixtures/sendparam_response.xml",
     "spec/message_spec.rb",
     "spec/reply_spec.rb",
     "spec/sent_message_spec.rb",
     "spec/smsinabox_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "tasks/deployment.rake",
     "tasks/environment.rake",
     "tasks/rspec.rake",
     "tasks/website.rake"
  ]
  s.homepage = %q{http://github.com/kennethkalmer/smsinabox}
  s.post_install_message = %q{
For more information on smsinabox, see http://www.opensourcery.co.za/smsinabox

Setup your account by running sms-setup now. You can then use the following
commands to interact with SMS in a Box:

sms-send: Send SMS messages
sms-credit: Quick overview of the credit available
sms-replies: Quick access to your replies
sms-setup: To change the account details
}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby API for sending text messages via http://www.smsinabox.co.za}
  s.test_files = [
    "spec/delivery_report_spec.rb",
     "spec/message_spec.rb",
     "spec/reply_spec.rb",
     "spec/sent_message_spec.rb",
     "spec/smsinabox_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.3.3"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.3.3"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.3.3"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end

