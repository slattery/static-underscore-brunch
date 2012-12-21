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

      uSource           = underscore.template(data, null, templateSettings).source
      uCall             = "_.template(" + data + ")"

      varResult = (if output is "call" then uCall else uSource)
      content = varName + " = " + varResult + ";\n\n"
      return result = content
    catch err
      return error = err
    finally
      callback error, result
        
