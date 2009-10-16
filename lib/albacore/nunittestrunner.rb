require File.join(File.dirname(__FILE__), 'support', 'albacore_helper')

class NUnitTestRunner
	include Logging
	include YAMLConfig
	
	attr_accessor :assemblies, :options, :path_to_command
	
	def initialize(path_to_command='')
		@path_to_command = path_to_command
		@options=[]
		@assemblies=[]
		super()
	end
	
	def get_command_line
		command = [@path_to_command, @assemblies.join(" "), @options.join(" ")].join(" ")
		@logger.debug "Build NUnit Test Runner Command Line: " + command
		command
	end
	
	def execute()
		@result = system(get_command_line)
	end
	
	def failed()
		@result == false
	end
end