(defun tex_prelude (filename)
    (with-open-file (str filename
                    :direction :output
                    :if-exists :supersede
                    :if-does-not-exist :create)
    (format str "\\documentclass[12pt]{article}~%")
    
    (format str "\\usepackage{chessboard}~%")
    (format str "\\usepackage[utf8]{inputenc}~%")
    (format str "\\usepackage[english]{babel}~%")
    (format str "\\usepackage{skak}~%")
    (format str "\\usepackage{amsmath}~%")
    (format str "\\usepackage{enumerate}~%")
    (format str "\\usepackage{amsfonts}~%")

    (format str "\\usepackage{color}~%~%")

    ;(format str "\\paperwidth=435pt~%")
    ;(format str "\\paperheight=620pt~%")
    ;(format str "\\footskip=20pt~%~%")
    (format str "\\usepackage[margin=0.8in]{geometry}~%~%")

    (format str "\\definecolor{lightgray}{gray}{0.95}~%~%")
    (format str "\\newcommand\\greybox[1]{%~%")
    (format str "  \\vskip\\baselineskip%~%")
    (format str "  \\par\\noindent\\colorbox{lightgray}{%~%")
    (format str "    \\begin{minipage}{\\textwidth}#1\\end{minipage}%~%")
    (format str "  }%~%")
    (format str "  \\vskip\\baselineskip%~%")
    (format str "}~%")

    (format str "~%~%\\begin{document}")
    )
)

(defun tex_etude (filename)
    (with-open-file (str filename
                    :direction :output
                    :if-exists :append
                    :if-does-not-exist :create)
    (format str "~&~%~%")     ; adds fresh-line, then new line
    (format str "\\end{document}")
    )
)

(defun tex_append (filename text)
    (with-open-file (str filename
                    :direction :output
                    :if-exists :append
                    :if-does-not-exist :create)
    (format str "~&~%~%    ~a" text)
    )
)

(defun tex_equation (filename text)
    (with-open-file (str filename
                    :direction :output
                    :if-exists :append
                    :if-does-not-exist :create)
    (format str "~&~%~%\\[ ~a \\]" text)
    )
)


(defun tex_compile (filename)
    (run-shell-command (concatenate 'string "pdflatex " filename))
)



(defun tex_txt (filename txt)
    (with-open-file (str filename
                    :direction :output
                    :if-exists :append
                    :if-does-not-exist :create)
        (with-open-file (stream txt) (format str "~%~%{ \\tt ")
    (do ((char (read-char stream nil)
               (read-char stream nil)))
               ((null char))
               (cond ;((equal char #\Tab) (format t "\\quad "))
                    ((equal char #\#) (format str "\\#"))
                    ((equal char #\Newline) (format str "~%~%"))
                    ((equal char #\/) (format str (string char) ))
                    ((equal char #\.) (format str "."))
                    ((equal char #\*) (format str "*"))
                    ((equal char #\{) (format str "\\{"))
                    ((equal char #\}) (format str "\\}"))
                    ((equal char #\[) (format str "["))
                    ((equal char #\]) (format str "]"))
                    ((equal char #\() (format str "("))
                    ((equal char #\)) (format str ")"))
                    ((equal char #\,) (format str ","))
                    ((equal char #\;) (format str ";"))
                    ((equal char #\\) (format str "\\textbackslash "))
                    ((equal char #\%) (format str "\\% "))
                    ((equal char #\") (format str "'" ))

                    ((equal char #\TAb) (format str "\\quad "))
                    ((equal char #\<) (format str "\\textless "))
                    ((equal char #\>) (format str "\\textgreater "))
                    ((equal char #\Space) (format str "\\,\\,\\,"))
                    ((equal char #\$) (format str "\\$"))

                    ((equal char #\=) (format str "="))
                    ((equal char #\-) (format str "-"))
                    ((equal char #\+) (format str "+"))
                    ((equal char #\0) (format str "0"))
                    ((equal char #\1) (format str "1"))
                    ((equal char #\2) (format str "2"))
                    ((equal char #\3) (format str "3"))
                    ((equal char #\4) (format str "4"))
                    ((equal char #\5) (format str "5"))
                    ((equal char #\6) (format str "6"))
                    ((equal char #\7) (format str "7"))
                    ((equal char #\8) (format str "8"))
                    ((equal char #\9) (format str "9"))

                    ((equal char #\a) (format str (string char) ))
                    ((equal char #\b) (format str (string char) ))
                    ((equal char #\c) (format str (string char) ))
                    ((equal char #\d) (format str (string char) ))
                    ((equal char #\e) (format str (string char) ))
                    ((equal char #\f) (format str (string char) ))
                    ((equal char #\g) (format str (string char) ))
                    ((equal char #\h) (format str (string char) ))
                    ((equal char #\i) (format str (string char) ))
                    ((equal char #\j) (format str (string char) ))
                    ((equal char #\k) (format str (string char) ))
                    ((equal char #\l) (format str (string char) ))
                    ((equal char #\m) (format str (string char) ))
                    ((equal char #\n) (format str (string char) ))
                    ((equal char #\o) (format str (string char) ))
                    ((equal char #\p) (format str (string char) ))
                    ((equal char #\q) (format str (string char) ))
                    ((equal char #\r) (format str (string char) ))
                    ((equal char #\s) (format str (string char) ))
                    ((equal char #\t) (format str (string char) ))
                    ((equal char #\u) (format str (string char) ))
                    ((equal char #\v) (format str (string char) ))
                    ((equal char #\w) (format str (string char) ))
                    ((equal char #\x) (format str (string char) ))
                    ((equal char #\y) (format str (string char) ))
                    ((equal char #\z) (format str (string char) ))
                    ((equal char #\A) (format str (string char) ))
                    ((equal char #\B) (format str (string char) ))
                    ((equal char #\C) (format str (string char) ))
                    ((equal char #\D) (format str (string char) ))
                    ((equal char #\E) (format str (string char) ))
                    ((equal char #\F) (format str (string char) ))
                    ((equal char #\G) (format str (string char) ))
                    ((equal char #\H) (format str (string char) ))
                    ((equal char #\I) (format str (string char) ))
                    ((equal char #\J) (format str (string char) ))
                    ((equal char #\K) (format str (string char) ))
                    ((equal char #\L) (format str (string char) ))
                    ((equal char #\M) (format str (string char) ))
                    ((equal char #\N) (format str (string char) ))
                    ((equal char #\O) (format str (string char) ))
                    ((equal char #\P) (format str (string char) ))
                    ((equal char #\Q) (format str (string char) ))
                    ((equal char #\R) (format str (string char) ))
                    ((equal char #\S) (format str (string char) ))
                    ((equal char #\T) (format str (string char) ))
                    ((equal char #\U) (format str (string char) ))
                    ((equal char #\V) (format str (string char) ))
                    ((equal char #\W) (format str (string char) ))
                    ((equal char #\X) (format str (string char) ))
                    ((equal char #\Y) (format str (string char) ))
                    ((equal char #\Z) (format str (string char) ))

        )
    )
            (format str "}")

)
    )
)



(defun tex_r (filename R)
        ; create .r file from R
    (with-open-file (rfile "tmp.r"
                    :direction :output
                    :if-exists :supersede
                    :if-does-not-exist :create)
    (format rfile "library(MASS)~%print(~a)" R)     ; adds
    )
    (run-shell-command "Rscript tmp.r > tmp.dat")

    ;;  append tmp.dat to filename
    (tex_append filename "\\greybox{

    ") (with-open-file (str filename
                        :direction :output
                        :if-exists :append
                        :if-does-not-exist :create)
            (format str "\\texttt{ \\textgreater \\,\\,\\,~a }~%~%" R)
    )
    (tex_txt filename "tmp.dat")
    (tex_append filename "\\
    }")
)
