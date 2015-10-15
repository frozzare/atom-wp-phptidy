child_process = require 'child_process'
os            = require 'os'

module.exports =
	activate: (state) ->
		atom.commands.add 'atom-workspace', 'wp-phptidy:run': => @run()
	
	run: ->
		editor = atom.workspace.getActivePaneItem()
		editor.save()

		file = editor?.buffer.file
		filepath = file?.path

		if filepath.length
			if os.type() is 'Windows_NT'
				child_process.exec('php ' + __dirname + '/../vendor/wp-phptidy.php replace ' + filepath, {}, (error, stdout, stderror) -> 
					if error?
						atom.notifications.addError '
						[WP-PHPTidy] PHP is not installed or there was
						an error running it.',
						{dismissable: true}
				);
				
			else
		  		child_process.exec(__dirname + '/../vendor/wp-phptidy.php replace ' + filepath)
