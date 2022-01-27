# Enable favorite colors
colorscheme gruvbox

# configure plug.kak
source "%val{config}/plugins/plug.kak/rc/plug.kak"

plug "andreyorst/plug.kak" branch "dev" noload
plug "andreyorst/smarttab.kak"
plug "AdamChristiansen/kakclip" config %{
	kakclip-enable
}
plug "ul/kak-lsp" do %{
	cargo build --release --locked
		cargo install --force --path .
}
plug "andreyorst/fzf.kak"
plug "whereswaldon/kakdown"
plug "whereswaldon/ledger.kak"
plug "whereswaldon/shellcheck.kak"
plug "whereswaldon/myrddin-kak"
plug "occivink/kakoune-gdb"
plug "occivink/kakoune-sudo-write"
plug "laelath/kakoune-show-matching-insert"
plug "eraserhd/kak-ansi"

set-option global aligntab false
set-option global tabstop 4
set-option global indentwidth 4

hook global InsertChar \t %{ try %{
	execute-keys -draft "h<a-h><a-k>\A\h+\z<ret><a-;>;%opt{indentwidth}@"
}}
map global insert <s-tab> '<a-;><lt>'

hook global WinCreate .* %{
# Always number lines
	add-highlighter window/nl number-lines
# Always soft-wrap lines
		add-highlighter window/wrap wrap -word -indent
}

set-option global scrolloff 10,4
map -docstring "Interpret file as ledger file" global user L ':set window filetype ledger<ret>'

# enable editorconfig
hook global BufOpenFile .* editorconfig-load
hook global BufNewFile .* editorconfig-load

# Easy way to open/edit config
map -docstring "edit kakrc" global user e ':e ~/.config/kak/kakrc<ret>'
map -docstring "source kakrc" global user s ':source ~/.config/kak/kakrc<ret>'
map -docstring "start rover" global user r ':terminal rover<ret>'
map -docstring "copy to X11 clipboard" global user c ':xcopy<ret>'
map -docstring "paste from X11 clipboard" global user v ':xpaste<ret>'
map -docstring "FZF mode" global user f ': fzf-mode<ret>'
map -docstring "show whitespace" global user w ': add-highlighter buffer/ show-whitespaces<ret>'
map -docstring "show whitespace" global user W ': remove-highlighter buffer/show-whitespaces<ret>'
map -docstring "jump to debug buffer" global user d ':b *debug*<ret>'
map -docstring "highlight references" global user h ':lsp-highlight-references<ret>'
map -docstring "list references" global user r ':lsp-rename-prompt<ret>'
map -docstring "next reference" global user n ':lsp-references-next-match<ret>'
map -docstring "prev reference" global user p ':lsp-reference-previous-match<ret>'

# Register custom hooks whenever I open a markdown file.
hook global WinSetOption filetype=markdown %{
# Print in the debug buffer so that I can tell the hook fired
	echo -debug "Markdown Mode Enabled"
# Create easy user-mode mapping to format tables
		map -docstring "format markdown table under cursor" buffer user t :md-format-table<ret>
		map -docstring "begin live-previewing this document in Firefox" buffer user p :md-preview<ret>
}

hook global WinSetOption filetype=python %{
	jedi-enable-autocomplete
}

hook global WinSetOption filetype=go %{
	set window lintcmd 'golangci-lint run'
		lsp-enable-window
		lint-enable
		hook buffer BufWritePre .* %{
			go-format -use-goimports
				lint
		}
}

# clipboard configs
map -docstring "paste from clipboard after" global user p ':kakclip-paste-after<ret>'
map -docstring "paste from clipboard before" global user P ':kakclip-paste-before<ret>'
map -docstring "replace from clipboard" global user R ':kakclip-replace<ret>'
map -docstring "yank selection to clipboard" global user y ':kakclip-yank-selection<ret>'
map -docstring "yank entire buffer to clipboard" global user Y ':kakclip-yank-buffer<ret>'
