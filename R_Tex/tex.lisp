(load "functions.lisp")
(tex_prelude 'Oxford.tex)

;(tex_append 'Oxford.tex "\\greybox{1:10}")
;(tex_R "oxford.tex" "1:10")
;(tex_R "oxford.tex" "seq(from=2, to=6, by=0.4)")

(tex_append "oxford.tex" "    \\noindent\\textbf{Exercise 2.2.}
    Here is an example I wrote in C")
;(tex_txt 'oxford.tex 'test.c)
(tex_append 'oxford.tex "\\noindent\\textbf{Exercise 2.3.}")

(tex_R 'oxford.tex "seq(from=1, to=12, by=0.5)")
(tex_append 'oxford.tex "(vi)")
(Tex_R 'oxford.tex "rep(seq(1:10), 1:10)")

(tex_append 'oxford.tex " \\noindent\\textbf{Exercise 2.5.}")
(tex_append 'oxford.tex "The first twelve letters is given by")
(Tex_r 'oxford.tex "LETTERS[1:12]")
(tex_append 'oxford.tex "The odd letters by")
(tex_r 'oxford.tex "LETTERS[seq(1,26,2)]")
(Tex_r 'oxford.tex "names(hills)")
(tex_r 'oxford.tex "matrix(1:42, nrow=3, ncol=14)")
;(tex_R 'oxford.tex "hills[hills$dist >= 12,]")

(tex_etude 'Oxford.tex)

(tex_compile "oxford.tex")