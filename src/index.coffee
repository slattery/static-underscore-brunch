underscore = require 'underscore'
varPath = require 'path'

module.exports = class StaticUnderscoreCompliler
  brunchPlugin: yes
  type: 'template'
  extension: 'jst'
  
  constructor: (@config) ->
    null
    
  compile: (data, path, callback) ->
    try
      varExt            = varPath.extname(path)
      varName           = varPath.basename(path, varExt)
      output            = @config.plugins?.static_underscore?.output ? "source"
      templateSettings  = @config.plugins?.underscore
      if output is "call"
        callData        = data
                          .toString()
                          .replace(/\"/g, '\\\"')
                          .split('\n')
                          .join ' \\\n'      
        varResult         = '_.template("' + callData + '")'
      else
        varResult         = underscore.template(data, null, templateSettings).source
      content = "var " + varName + " = " + varResult + ";\n\n"
      return result = content
    catch err
      return error = err
    finally
      callback error, result
        
