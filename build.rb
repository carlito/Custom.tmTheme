
# Configuration

file_name  = 'Theme.tmTheme'
author     = 'Carlito'

red        = '#e74800'
blue       = '#0066ff'
pink       = '#ff00ac'
green      = '#00bc2c'
grey_light = '#adadad'
grey_dark  = '#666666'
black      = '#111111'
white      = '#ffffff'


replacements = {

  'author'                           => author,

  'editor-background'                => '#ffffff',   # Background color
  'editor-foreground'                => '#11111130', # Text color (the alpha changes only the tab line color)
  'editor-guide'                     => '#11111120', # Indentation Guides
  'editor-invisibles'                => black,       # Not sure what this does
  'editor-caret'                     => pink,        # Cursor
  'editor-gutter-text'               => '#cdcdcd',   # Line numbers
  'editor-line-highlight'            => '#e2e2e2',   # Current line highlight in gutter
  'editor-selection-background'      => '#c2e8ff',
  'editor-selection-border'          => '#c2e8ff',
  'editor-find-highlight-background' => black,
  'editor-find-highlight-foreground' => white,

  'html-doctype'                     => grey_light,
  'html-tags'                        => blue,
  'html-tag-names'                   => blue,
  'html-tag-brackets'                => blue + '50',
  'html-attribute-punctuation'       => pink + '60',
  'html-tag-punctuation'             => blue,
  'html-entities'                    => blue,
  'html-attribute-names'             => pink,
  'html-attribute-values'            => green,
  'html-text'                        => '#333333',

  'css-selectors'                    => blue,
  'css-pseudoelement'                => black,
  'css-property-names'               => pink,
  'css-property-values'              => green,
  'css-brackets'                     => black,
  'css-separator-key-value'          => black,
  'css-punctuation.terminator'       => black, # Apostroph after definitions
  'css-at-rules'                     => black,

  'scss-mixin-names'                 => red,

  'php-tags'                         => grey_light,
  'php-functions'                    => red,
  'php-variables'                    => black


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
  self_location = File.dirname(__FILE__)

  suffix = '##';

  files.each do|file|
    file = File.read(self_location + "/parts/#{file}")
    replacements.each do|key, value|
      variable = suffix + key
      file = file.gsub("#{variable}", value)
    end
    output += file
  end

  # Format XML
  formatted_output = REXML::Document.new(output)
  formatter = REXML::Formatters::Pretty.new
  formatter.compact = true

  output_file = self_location + '/' + output_file_name

  File.open(output_file,'w') do |output_file|
    output_file.puts formatted_output
    puts 'Builded ' + output_file_name
  end

end

puts build(file_name, replacements, files)

