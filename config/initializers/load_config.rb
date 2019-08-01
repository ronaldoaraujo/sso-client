Dir[File.join(Rails.root, "lib", "*.rb")].each {|file| require file }
