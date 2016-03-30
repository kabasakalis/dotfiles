RubyNavigatorView = require './ruby-navigator-view'
{CompositeDisposable} = require 'atom'

module.exports = RubyNavigator =
  rubyNavigatorView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @rubyNavigatorView = new RubyNavigatorView(state.rubyNavigatorViewState)
    @modalPanel = atom.workspace.addRightPanel(item: @rubyNavigatorView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'ruby-navigator:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @rubyNavigatorView.destroy()

  serialize: ->
    rubyNavigatorViewState: @rubyNavigatorView.serialize()

  toggle: ->
    console.log 'RubyNavigator was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @rubyNavigatorView.load_data()
      @modalPanel.show()
