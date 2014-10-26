
my $isWin = ($^O =~ /win32/i);
my $buildStr = "gcc -w"
             . " -I./include"
             . " -L."
             . " include/duktape/duktape.c"
             . " include/thread/tinycthread.c"
             . " include/http/http_parser.c"
             . " src/loop/core.c"
             . " -o como" . ($isWin ? ".exe" : "");
            if ($isWin){
                $buildStr .= " include/ansi/ANSI.c"
                          . "";
            } else {

            }

            $buildStr .= " src/main.c";

            if ($isWin){
                $buildStr .= " -lws2_32";
            } else {
                $buildStr .= " -lrt -lpthread -lm  -ldl";
            }

system($buildStr);

1;
