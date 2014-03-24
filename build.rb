
# Configuration

file_name = 'Theme.tmTheme'

replacements = {
  '##author'  => 'Carlito',
  '##red'     => '#e74800',
  '##blue'    => '#0066ff',
  '##pink'    => '#c800a4',
  '##green'   => '#00bc2c'
}

files = [
  'head.xml',
  'global.xml',
  'comments.xml',
  'invalid.xml',
  'basic.xml',
  'strings.xml',
  'html.xml',
  'css.xml',
  'scss.xml',
  'markup.xml',
  'ruby.xml',
  'php.xml',
  'diff.xml',
  'misc.xml',
  'linter.xml',
  'foot.xml'
]


# Build process 
# (Don't change anything below if you're not sure what you're doing.)

require 'rexml/document'

def build(output_file_name, replacements, files)
  
  output = ''
  
  self_location = File.dirname(__FILE__);

  files.each do|file|

    #before_file = before_file.gsub('{filename}', "#{file}")
    file = File.read(self_location + "/parts/#{file}")

    # Wirft noch Fehler
    # replacements.each do|key, value|
    #   output = output + file.gsub(key, value)
    # end
    
    output = output + file

  end

  # Format XML
  formatted_output = REXML::Document.new(output)
  formatter = REXML::Formatters::Pretty.new
  formatter.compact = true

  output_file = self_location + '/' + output_file_name

  File.open(output_file,'w') do |output_file|
    output_file.puts formatted_output 
    puts 'Builded ' + output_file_name
    return true
  end

end

puts build(file_name, replacements, files)

