fs   = require 'fs-plus'
path = require 'path'

# jQuery
{$} = require('atom-space-pen-views')

# Open file on click
$(document).ready ->
  $('.method').on 'click', (e) ->
    method  = $(this)
    promise = atom.workspace.open(method.data("name"), { initialLine: method.data("line") })
  $('.ruby-class').on 'click', (e) ->
    return unless (e.target == this)
    $(this).children().slideToggle()

module.exports =
class RubyNavigatorView

  constructor: (serializedState) ->
    # Create root element
    @navigator = document.createElement('div')
    @navigator.classList.add('ruby-navigator')

  load_data: ->
    projectPath = atom.project.getPaths()[0]
    file = path.join(projectPath, 'class-index.json')

    if (!fs.existsSync(file))
      this.display_missing_file_warning()
      return

    contents = fs.readFileSync(file)
    json     = JSON.parse(contents)

    for own file_name of json
      for own class_name of json[file_name]
        class_element = this.add_class(class_name)
        (this.add_method(method, file_name, class_element) for method in json[file_name][class_name])

  add_method: (method, file_name, class_element) ->
    message = document.createElement('a')
    message.textContent = method["name"]
    message.setAttribute('data-name', file_name) # needs to be file name instead of method name
    message.setAttribute('data-line', method["line"])
    message.classList.add('method')
    class_element.appendChild(message)

  add_class: (name) ->
    ruby_class = document.createElement('div')
    ruby_class.textContent = name
    ruby_class.classList.add('ruby-class')
    @navigator.appendChild(ruby_class)
    return ruby_class

  display_missing_file_warning: ->
    atom.notifications.addWarning(
     'Missing class-index.json.
     You can generate it using the indexer
     command from the class-indexer gem.')

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @navigator.remove()

  getElement: ->
    @navigator
