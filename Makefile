HEAD=head.htm
FOOT=foot.htm
INC=$(HEAD) $(FOOT)
RES=logo.jpg style.css
HTML=index.html about.html contact.html
SITE=$(patsubst %.md,site/%,$(wildcard *.md))

all: $(SITE) $(INC)

site/%: %.md $(INC) Makefile
	grep "^#[[:space:]]" $< | sed 's/^#[[:space:]]//g' >title
	sed -r "s~TITLE~`cat title`~g" $(HEAD) >head
	markdown $< |sed -r "s/^(.*)/\t\t\1/g" >content
	cat head content $(FOOT) >$@
	rm head title content
