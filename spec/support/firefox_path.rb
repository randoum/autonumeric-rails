def firefox_path
  file = File.expand_path('../../firefox_path', __FILE__)
  raise "#{file} does not exist" unless File.file? file
  path = File.open(file) { |f| f.gets }.strip
  raise "Firefox executable #{path} does not exist" unless File.file? path

  path

rescue StandardError => e
  $stderr.puts ''
  $stderr.puts '--------------------------'
  $stderr.puts 'Firefox ESR path not found'
  $stderr.puts ''
  $stderr.puts 'You need to download last Firefox ESR (v 45.3.0 ESR for example) in a directory of your system'
  $stderr.puts "Then create the file <#{file}> where you would write the absolute path of firefox executable"
  $stderr.puts ''
  $stderr.puts "Message: #{e.message}"

  raise SystemExit
end