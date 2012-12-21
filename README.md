## static-underscore-brunch
Adds [underscore](http://underscorejs.org) template support to 
[brunch](http://brunch.io) without wrapping the output in modules of type commonjs/amd.

## Usage
Add `"static-underscore-brunch": "x.y.z"` to `package.json` of your brunch app.

Pick a plugin version that corresponds to your minor (y) brunch version.

If you want to use git version of plugin, add
`"static-underscore-brunch": "git+ssh://git@github.com:slattery/static-underscore-brunch.git"`.

### Useful convensions
Brunch concatenates all your files in `app/`, `test/` and `vendor/` directories to two files by default:

* `app.js` contains your application code.
* `vendor.js` contains code of libraries you depend on (e.g. jQuery, Underscore).

You may wish to add a `template` file handler that points to a different output file. Inside config.coffee:
```coffeescript
templates:
	defaultExtension: 'jst'
 	joinTo: 
 		'javascripts/templates.js': /^app\/templates/
```
### Configuration options
Output is based on plugins.static_underscore.output in config.coffee:
```coffeescript
plugins:
	static_underscore:
 		output: 'source'
```
	* `source` (default) will be pre-compiled to the output file, using the filename (minus extension) as the var name.
	* `call` will print underscore template calls to the output file:
		`filenameAsVarName = _.template( <your markup here/> );`