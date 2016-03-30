{CompositeDisposable} = require 'atom'

module.exports = Html2haml =
  # html2hamlView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable
    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'html2haml:convert': => @convert()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()

  serialize: ->
    # nothing to do.

  convert: ->
    # editor = atom.workspace.activePaneItem
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()

    html = selection.getText()
    post_data = JSON.stringify({'page': {'html': html}})


    http = require("http")
    options =
      host: "html2haml-attributes.herokuapp.com"
      path: "/api.json"
      method: "POST"
      headers:
        "Content-Type": 'text/html;charset=utf-8'
        "Content-Length": post_data.length

    callback = (response) ->
      str = ""
      response.on "data", (chunk) ->
        str += chunk

      response.on "end", ->
        result = JSON.parse(str)
        editor.insertText(result.page.haml)

    request = http.request(options, callback)
    request.write(post_data, encoding = 'utf8')

    request.end()
