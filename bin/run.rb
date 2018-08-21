#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
choice_and_input = get_input_from_user
show_choice(choice_and_input)
