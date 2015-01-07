HEAD=head.htm
FOOT=foot.htm
INC=$(HEAD) $(FOOT)
RES=logo.jpg style.css
HTML=index.html about.html contact.html
SITE=$(patsubst content/%.md,site/%,$(wildcard content/*.md))

all: $(SITE) $(INC)

site/%: content/%.md $(INC) Makefile util
	./util build $@ $< $(HEAD) $(FOOT)
