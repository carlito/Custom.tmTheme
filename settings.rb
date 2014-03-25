
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