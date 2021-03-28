" Set global flag to allow checking in custom user config
let g:vscode = 1

let s:currDir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" Adjust rtp path
let &runtimepath = &runtimepath . ',' . s:currDir . '/vim-altercmd'

" Used to execute vscode command
let s:vscodeCommandEventName = 'vscode-command'
" Used to execute vscode command with some range (the specified range will be selected and the command will be executed on this range)
let s:vscodeRangeCommandEventName = 'vscode-range-command'
" Used for externsion inter-communications
let s:vscodePluginEventName = 'vscode-neovim'

" RPC and global functions

function! VSCodeCall(cmd, ...) abort
    call rpcrequest(g:vscode_channel, s:vscodeCommandEventName, a:cmd, a:000)
endfunction

function! VSCodeCallRange(cmd, line1, line2, leaveSelection, ...) abort
    call rpcrequest(g:vscode_channel, s:vscodeRangeCommandEventName, a:cmd, a:line1, a:line2, 0, 0, a:leaveSelection, a:000)
endfunction

function! VSCodeCallRangePos(cmd, line1, line2, pos1, pos2, leaveSelection, ...) abort
    call rpcrequest(g:vscode_channel, s:vscodeRangeCommandEventName, a:cmd, a:line1, a:line2, a:pos1, a:pos2, a:leaveSelection, a:000)
endfunction

function! VSCodeNotify(cmd, ...)
    call rpcnotify(g:vscode_channel, s:vscodeCommandEventName, a:cmd, a:000)
endfunction

function! VSCodeNotifyRange(cmd, line1, line2, leaveSelection, ...)
    call rpcnotify(g:vscode_channel, s:vscodeRangeCommandEventName, a:cmd, a:line1, a:line2, 0, 0, a:leaveSelection, a:000)
endfunction

function! VSCodeNotifyRangePos(cmd, line1, line2, pos1, pos2, leaveSelection, ...)
    call rpcnotify(g:vscode_channel, s:vscodeRangeCommandEventName, a:cmd, a:line1, a:line2, a:pos1, a:pos2, a:leaveSelection, a:000)
endfunction

function! VSCodeExtensionCall(cmd, ...) abort
    call rpcrequest(g:vscode_channel, s:vscodePluginEventName, a:cmd, a:000)
endfunction

function! VSCodeExtensionNotify(cmd, ...) abort
    call rpcnotify(g:vscode_channel, s:vscodePluginEventName, a:cmd, a:000)
endfunction
