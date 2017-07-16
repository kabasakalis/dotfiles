def write_google_docstring_args(args, snip):
	kwargs = [arg for arg in args if arg.is_kwarg()]
	args = [arg for arg in args if not arg.is_kwarg()]

	if args:
		snip += "Args:"
		snip.shift()
		for arg in args:
			snip += format_arg(arg, GOOGLE)
		snip.unshift()
		snip.rv += '\n' + snip.mkline('', indent='')

	if kwargs:
		snip += "Kwargs:"
		snip.shift()
		for kwarg in kwargs:
			snip += format_arg(kwarg, GOOGLE)
		snip.unshift()
		snip.rv += '\n' + snip.mkline('', indent='')


