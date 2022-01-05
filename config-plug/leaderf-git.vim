let g:Lf_PreviewResult = get(g:, 'Lf_PreviewResult', {})

let g:Lf_PreviewResult.Commit = 1
let g:Lf_PreviewResult.BCommit = 1

nnoremap <silent> <leader>lc :LeaderfCommit<CR>
nnoremap <silent> <leader>bc :LeaderfBCommit<CR>

nnoremap <silent> <leader>lgb :LeaderfBranch<CR>
nnoremap <silent> <leader>lgs :LeaderfGstatus<CR>

