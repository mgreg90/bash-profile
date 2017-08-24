METHOD_NAME_REGEX = /def self\.(?<method_name>\w*)/i
ROOT = File.expand_path(File.dirname(__FILE__))

ruby_scripts = []
File.open(File.join(ROOT, "script.rb")) do |f|
  f.each_line do |line|
    match = line.match(METHOD_NAME_REGEX)
    ruby_scripts << match[:method_name] if match
  end
end
puts "WARNING: Script Aliases Failed" if ruby_scripts.empty?
puts ruby_scripts.join(' ')