require "rexml/document" 


files = [
  'head.xml',
  'global.xml',
  'comments.xml',
  'invalid.xml',
  'basic.xml',
  'strings.xml',
  'html.xml',
  'css.xml',
  'markup.xml',
  'php.xml',
  'diff.xml',
  'misc.xml',
  'linter.xml',
  'foot.xml'
]

replacements = {
  '##red'   => '#e74800',
  '##blue'  => '#0066ff',
  '##pink'  => '#c800a4',
  '##green' => '#00bc2c'
}

variable_prefix = '##'


#before_file = '/* {filename} */' + "\n\n"
#args        = ARGV;

def merge(files, replacements)
  
  output = ''
  output_file = 'Theme.tmTheme'
  
  files.each do|file|
    
    #before_file = before_file.gsub('{filename}', "#{file}")
    file        = File.read("parts/#{file}")

    # Wirft noch Fehler
    # replacements.each do|key, value|
    #   output = output + file.gsub(key, value)
    # end
    
    output = output + file + "\n\n"

  end


  # Format XML
  formatted_output = REXML::Document.new(output)
  formatter = REXML::Formatters::Pretty.new
  formatter.compact = true
  #formatter.write(formatted_output, $stdout)
  

  File.open(output_file,'w') do |output_file|
    output_file.puts formatted_output 
  end

  puts 'Builded ' + output_file

end

puts merge(files, replacements)