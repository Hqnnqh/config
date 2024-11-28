if status is-interactive
    # Commands to run in interactive sessions can go here
	#
	#fish_add_path ~/.cargo/bin
	fish_add_path ~/opt/ccross/bin
	fish_add_path ~/.local/bin
	fish_add_path ~/.rustup/toolchains/esp/xtensa-esp-elf/esp-13.2.0_20230928/xtensa-esp-elf/bin
	
	function man
		command man $argv | bat -l man
	end

	function bless
		command bat --paging=always $argv
	end
end
