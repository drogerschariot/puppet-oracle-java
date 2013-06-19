puppet-oracle-java
------------------

Installs Oracle JDK or JRE 1.6 or 1.7. Tested on Ubuntu 12.04, Debian 7, and CentOS 6.4 using [Puppetry](https://github.com/drogerschariot/Puppetry). 


### Install ###

- Clone module to your puppetmaster or masterless modules directory.
- Change name of module from puppet-oracle-java to oracle_java

### Basic Config ###

To install default <b>JDK 7x64</b>, simply add ‘include oracle_java’ to your manifest.

### Custom Java Config ###

- Download jdk or jre 1.6 or 1.7 from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html) and place the package in the oracle_java/files directory (do not rename).
- Declare the class:
<pre>
<code>
class { "oracle_java":
&nbsp;&nbsp;&nbsp; type      => "<i>type</i>",
&nbsp;&nbsp;&nbsp; arc       => "<i>arc</i>,
&nbsp;&nbsp;&nbsp; version   => "<i>version</i>",
&nbsp;&nbsp;&nbsp; os        => "<b>linux</b>",
}
</code>
</pre>

It is import that you match the params with the java package you downloaded from oracle.

For example, if you downloaded the <b>jdk-7u21-linux-x64.tar.gz</b>, your params should be:

 type     => “jdk”<br />
 arc      => “x64“<br />
 version  => “7u21“<br />
 os       => “linux”<br />
 

###Contrib
 
 Fork and request!
 
