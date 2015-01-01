HEAD=head.htm
FOOT=foot.htm
INC=$(HEAD) $(FOOT)
RES=logo.jpg style.css
HTML=index.html about.html contact.html
SITE=$(patsubst content%.md,site/%,$(wildcard content/*.md))

all: $(SITE) $(INC)

site/%: content/%.md $(INC) Makefile
	grep "^#[[:space:]]" $< | sed 's/^#[[:space:]]//g' >title
	sed -r "s~TITLE~`cat title`~g" $(HEAD) >head
	markdown $< |sed -r "s/^(.*)/\t\t\1/g" >_content
	cat head _content $(FOOT) >$@
	rm head title _content
