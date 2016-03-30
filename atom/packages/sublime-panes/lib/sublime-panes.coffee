SublimePanesView = require './sublime-panes-view'
{CompositeDisposable} = require 'atom'

module.exports = SublimePanes =
  sublimePanesView: null
  modalPanel: null
  subscriptions: null
  activeHandler: null
  hiddenTab: null
  newItem: null
  active: null
  register: null

  activate: (state) ->
    @sublimePanesView = new SublimePanesView(state.sublimePanesViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @sublimePanesView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable
    @activeHandler = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'sublime-panes:toggle': => @toggle()

    @register = atom.workspace.onDidAddPaneItem (event) => @registerInterest(event)

    @active = true

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @sublimePanesView.destroy()
    @activeHandler.dispose()
    @newItem.destroy()
    @register.dispose()

  serialize: ->
    sublimePanesViewState: @sublimePanesView.serialize()

  toggle: ->
    if @active
      @register.dispose()
      @active = false
    else
      @register = atom.workspace.onDidAddPaneItem (event) => @registerInterest(event)
      @active = true


  registerInterest: (event) ->
    @cleanUp()
    @activeHandler = new CompositeDisposable
    @activeHandler.add event.pane.onDidChangeActiveItem (item) => @catchItem(item)

  catchItem: (activeItem) ->
    @activeHandler.dispose()
    @newItem = activeItem
    pane = atom.workspace.paneForItem(@newItem)
    for element in atom.views.getView(pane).getElementsByClassName('active')
      @hiddenTab = element
      element.parentNode.removeChild(element)
    @activeHandler = new CompositeDisposable
    @activeHandler.add @newItem.onDidChangeModified => @restoreTab()
    @activeHandler.add pane.onDidChangeActiveItem => @cleanUp()

  restoreTab: ->
    @activeHandler.dispose()
    @newItem = null
    pane = atom.workspace.getActivePane()
    for element in atom.views.getView(pane).getElementsByClassName('tab-bar')
      element.appendChild @hiddenTab

  cleanUp: ->
    @activeHandler.dispose()
    if @newItem?
      pane = atom.workspace.paneForItem(@newItem)
      pane.destroyItem(@newItem)
      @newItem = null
