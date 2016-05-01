describe 'Tmux grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-tmux')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.tmux')

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'source.tmux'

  it 'parses comments', ->
    {tokens} = grammar.tokenizeLine('# My comment')

    expect(tokens[0]).toEqual value: '#', scopes: ['source.tmux', 'comment.line.number-sign.tmux', 'punctuation.definition.comment.tmux']
    expect(tokens[1]).toEqual value: ' My comment', scopes: ['source.tmux', 'comment.line.number-sign.tmux']

  it 'parses both single and double quoted strings', ->
    {tokens} = grammar.tokenizeLine("'My single quoted string'")

    expect(tokens[0]).toEqual value: "'", scopes: ['source.tmux', 'string.quoted.single.tmux', 'punctuation.definition.string.begin.tmux']
    expect(tokens[1]).toEqual value: 'My single quoted string', scopes: ['source.tmux', 'string.quoted.single.tmux']
    expect(tokens[2]).toEqual value: "'", scopes: ['source.tmux', 'string.quoted.single.tmux', 'punctuation.definition.string.end.tmux']

    {tokens} = grammar.tokenizeLine('"My double quoted string"')

    expect(tokens[0]).toEqual value: '"', scopes: ['source.tmux', 'string.quoted.double.tmux', 'punctuation.definition.string.begin.tmux']
    expect(tokens[1]).toEqual value: 'My double quoted string', scopes: ['source.tmux', 'string.quoted.double.tmux']
    expect(tokens[2]).toEqual value: '"', scopes: ['source.tmux', 'string.quoted.double.tmux', 'punctuation.definition.string.end.tmux']

  it 'parses switches', ->
    {tokens} = grammar.tokenizeLine('set -g mouse-select-pane on')

    expect(tokens[4]).toEqual value: 'on', scopes: ['source.tmux', 'constant.language.tmux']

  it 'parses options', ->
    {tokens} = grammar.tokenizeLine('set -g status-justify centre')
    expect(tokens[2]).toEqual value: 'status-justify', scopes: ['source.tmux', 'support.constant.tmux']

    {tokens} = grammar.tokenizeLine('setw -g mode-mouse on')
    expect(tokens[2]).toEqual value: 'mode-mouse', scopes: ['source.tmux', 'entity.name.tag.tmux']

    {tokens} = grammar.tokenizeLine('bind - split-window -v')
    expect(tokens[2]).toEqual value: 'split-window', scopes: ['source.tmux', 'support.function.tmux']

  it 'parses functions', ->
    {tokens} = grammar.tokenizeLine('setw -g pane-base-index 1')
    expect(tokens[0]).toEqual value: 'setw', scopes: ['source.tmux', 'support.function.tmux']
