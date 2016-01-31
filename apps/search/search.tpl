% query=`{echo $post_arg_search}
<h1>%($query%)</h1>

%{
results=`{for(i in `{ls $sitedir/*/*.html; find -L $sitedir -name body}) {
              grep -li $query $i
          } | sed 's,_werc/comments/[0-9]*/body,.html,'}
for(i in `{echo $results | tr ' ' $NEW_LINE | sort | uniq}) {
    cat $i | sed 's,^<a id="(.*)" href="#top">,<a id="\1" href="'`{echo $i | sed 's,^'$sitedir',,; s/.html$//'}^'#top">,'
}
%}
