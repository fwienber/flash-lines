flash-lines
===========

An example of how to use [Jangaroo](http://www.jangaroo.net) to run Flash AS3 code in a browser without a Flash plugin.

[Original Flash version](http://lab.andre-michelle.com/lines) by Andre Michelle
Adapted for Jangaroo by Frank Wienberg.

Getting started with Jangaroo Flash Development in ten steps:

1. Install [Java 6 JRE](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
2. Install [Maven 3](http://maven.apache.org/download.html)
3. Press the "Downloads" button above
4. Download .zip or .tar.gz
5. unpack into any directory
6. `cd` into fwienber-flash-lines-xxxxxxx (where xxxxxxx is the version you downloaded)
7. `mvn package`
8. (the whole Java universe downloads, please be patient)
9. start `target\flash-lines-0.8.0-SNAPSHOT\index.html` (do not use IE < 9)
10. edit the source under `src\main\joo` with your favorite AS3 IDE, then `mvn package` again (quite fast
this time!), reload in the browser (may have to clear browser cache first)

The AS3 source code is compiled to JavaScript with the Jangaroo compiler, using the Jangaroo Flash Library
(which is still quite incomplete, but suffices for this demo). With only a few lines of JavaScript,
that code is loaded and run in any browser supporting the HTML5 canvas element (i.e. not IE < 9).
If you are connected to the Internet and your browser has a Flash plugin, you can see the original demo
running in a Flash player at the right side. Don't they look like twins?
