## underscore-brunch
Adds precompiled underscore template support to
[brunch](http://brunch.io).

## Usage
Add `"underscore-brunch": "x.y.z"` to `package.json` of your brunch app.

Pick a plugin version that corresponds to your minor (y) brunch version.

If you want to use git version of plugin, add
`"underscore-brunch": "git+ssh://git@github.com:slattery/underscore-brunch.git"`.

## Doc
Output is based on extension
	* .tpl files will be pre-compiled to output file
	* .html files will print underscore template call
	to output file
		`filename = _.template( <your markup here/>);`