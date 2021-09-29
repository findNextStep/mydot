return {

    packer = { 'lfv89/vim-interestingwords',
        opt= true,
        fn = "InterestingWords",
        config=function()
        end
    },

    which_map = {
        k = {"<CMD>call InterestingWords('n')<CR>" , "highlight words"},
        K = {"<CMD>call UncolorAllWords()<CR>" , "diable all highlight"},
    }
}
