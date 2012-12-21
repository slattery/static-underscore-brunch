underscore = require 'underscore'
varPath = require 'path'

module.exports = class UnderscoreCompliler
  brunchPlugin: yes
  type: 'template'
  extension: 'tpl'
  pattern: /\.(?:tpl|html)$/
  
  constructor: (@config) ->
    null
    
  compile: (data, path, callback) ->
    try
      varExt = varPath.extname(path)
      varName = varPath.basename(path, varExt)
      uSource = underscore.template(data).source
      uCall = "_.template(" + data + ")"
      varResult = (if varExt is ".tpl" then uSource else uCall)
      content = varName + " = " + varResult + ";\n\n"
      return result = content
    catch err
      return error = err
    finally
      callback error, result
        
