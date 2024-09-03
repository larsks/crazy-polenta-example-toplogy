TOPOLOGY = topology.yaml

STARTUP_SCRIPTS = \
	isprouter111.startup \
	isprouter222.startup \
	node00.startup \
	node01.startup \
	node10.startup \
	node11.startup \
	remotehost.startup \
	router.startup

DIAGRAMS = \
	topology.svg \
	topology.png

all: $(STARTUP_SCRIPTS) lab.conf $(DIAGRAMS)

topology.svg: topology.dot
	dot -o $@ -T svg $<

topology.png: topology.dot
	dot -o $@ -T png $<

$(STARTUP_SCRIPTS) lab.conf: $(TOPOLOGY)
	makelab $(TOPOLOGY)

clean:
	rm -f $(STARTUP_SCRIPTS) lab.conf $(DIAGRAMS)
