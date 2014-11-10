child_process = require 'child_process'

module.exports =
	activate: (state) ->
		atom.commands.add 'atom-workspace', 'wp-phptidy:run': => @run()
	
	run: ->
		editor = atom.workspace.getActivePaneItem()
		file = editor?.buffer.file
		filepath = file?.path
		if filepath.length
		  child_process.exec(__dirname + '/../vendor/wp-phptidy.php replace ' + filepath)