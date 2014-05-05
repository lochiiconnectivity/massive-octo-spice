---
layout: default
author: wesyoung
---

## Quickstart
See our [Quickstart Guide](https://github.com/csirtgadgets/massive-octo-spice/wiki/InstallSource) to install from scratch.

## Downloads
<a class='btn btn-primary btn-lg' href='{{ codeurl }}/releases'>Releases</a>
<a class='btn btn-primary btn-lg' href='{{ codeurl }}/tarball/master'>TAR File</a>
<a class='btn btn-primary btn-lg' href='{{ codeurl }}/zipball/master'>ZIP File</a>

## Team 
@giovino, @jeffmurphy and @wesyoung

## Recent Posts
<ul class="posts">
    {% for post in site.posts limit:site.post_limit %}
      <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ site.baseurl }}{{ post.url }}">[{{ post.category }}] {{ post.title }}</a></li>
    {% endfor %}
</ul>
