TIMESTAMP:     $(date +%Y%m%d%H%M)


First copy the ~/.bash_history file to the directory before this one.
Second clear the history buffer history -c
Third Do the work
Fourth After the work save the history buffer history -w history/history-$(date +%Y%m%d%H%M).txt, write a journal in journal/journal-$(date +%Y%m%d%H%M).txt
DONE :)


Inside journal files there can be excerpts from the web.  The information is wrapped in following way:
  #BEGIN http://webpage.com
  text
  text
  #END http://webpage.com [EOF]

The ending EOF is only added if this is the last line.  Otherwise this is a continuation of a previous except.  With this you can use awk to extract some information.  

To list all of the excerpts simply:
  awk '/^#BEGIN/ {print $2}' journal/*

To list all of the excerpts that are completed:
  awk '/^#END .* EOF$? {print $2}' journal/*

You git the picture ;)


