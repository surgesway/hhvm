<?hh

ASYNC FUNCTION FOO() {
  RETURN "WHY ARE WE YELLING ASYNCHRONOUSLY\n";
}

ASYNC FUNCTION BAR() {
  $M = AWAIT FOO();
  ECHO $M;
}

\HH\Asio\join(BAR());
