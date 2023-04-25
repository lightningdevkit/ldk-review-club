---
layout: default
title: home
---
### A fortnightly review club for Lightning Dev Kit (LDK) PRs

<span class="question">What is this?</span> &nbsp;A fortnightly club for reviewing
LDK PRs at **{{ site.meeting_time }} usually every second {{ site.meeting_day }}** in
{{ site.meeting_location }}.

<span class="question">What's it for?</span> &nbsp;To help newer contributors
learn about the LDK review process. The review club is *not* primarily
intended to help open PRs get merged.

<span class="question">Who should take part?</span> &nbsp;Anyone who wants to
learn about contributing to LDK. All are welcome to come and ask
questions!

<span class="question">How do I take part?</span> Just show up on our Discord!
See [Attending your first PR Review Club](/your-first-meeting/) for more tips
on how to participate.

<span class="question">Who runs this?</span> &nbsp;Upcoming meetings are
scheduled by {{ site.coordinator }}.
The meetings are hosted by a variety of LDK contributors. See
some of our [previous hosts](/meetings-hosts/).

## Upcoming Meetings

<table>
{% for post in site.posts reversed %}
  {% capture components %}
  {%- for comp in post.components -%}
    <a href="/meetings-components/#{{comp}}">{{comp}}</a>{% unless forloop.last %}, {% endunless %}
  {%- endfor -%}
  {% endcapture %}
  {% if post.status == "upcoming" %}
    <tr>
      <div class="home-posts-post">
        <td class="Home-posts-post-date">{{ post.date | date_to_string }}</td>
        <td class="Home-posts-post-arrow">&raquo;</td>
        <td><a class="Home-posts-post-title" href="{{ post.url }}">{% if post.pr %}#{{ post.pr }} {% endif %} {{ post.title }}</a>
        ({{components}})
        <span class="host">hosted by
        <a class="host" href="/meetings-hosts/#{{post.host}}">{{ post.host }}</a>
        </span></td>
      </div>
    </tr>
  {%- endif -%}
{% endfor %}
</table>

We're always looking for interesting PRs to discuss in the review club and for
volunteer hosts to lead the discussion:

- If there's a PR that you'd like to discuss in a future meeting, feel free to suggest it in the Discord channel.
- If you'd like to host a meeting, look at the [information for meeting
  hosts](/hosting) and contact {{ site.coordinator_irc }} on Discord.

## Recent Meetings

<table>
{% assign count = 0 %}
{% for post in site.posts %}
  {% capture components %}
  {%- for comp in post.components -%}
    <a href="/meetings-components/#{{comp}}">{{comp}}</a>{% unless forloop.last %}, {% endunless %}
  {%- endfor -%}
  {% endcapture %}
  {% if post.status == "past" %}
    {% assign count = count | plus: 1 %}
    <tr>
      <div class="home-posts-post">
        <td class="Home-posts-post-date">{{ post.date | date_to_string }}</td>
        <td class="Home-posts-post-arrow">&raquo;</td>
        <td><a class="Home-posts-post-title" href="{{ post.url }}">{% if post.pr %}#{{ post.pr }}{% endif %} {{ post.title }}</a>
        ({{components}})
        <span class="host">hosted by <a class="host" href="/meetings-hosts/#{{post.host}}">{{ post.host }}</a></span></td>
      </div>
    </tr>
  {%- endif -%}
  {% if count == 4 %}
    {% break %}
  {% endif %}
{% endfor %}
</table>

See all [meetings](/meetings/).

## Other Resources for New Contributors

- Read the [Contributing to LDK
  Guide](https://github.com/lightningdevkit/rust-lightning/blob/main/CONTRIBUTING.md). This
  will help you understand the process and some of the terminology we use in
  LDK.
- Look at the [Good First
  Issues](https://github.com/lightningdevkit/rust-lightning/issues?q=is%3aissue+is%3aopen+label%3a%22good+first+issue%22)
  and [Up For
  Grabs](https://github.com/lightningdevkit/rust-lightning/issues?utf8=%e2%9c%93&q=label%3a%22up+for+grabs%22)
  list.
- Brush up on your Rust. There are [many references
  available](https://github.com/rust-unofficial/awesome-rust#resources) over and above [The Book](https://doc.rust-lang.org/book/).

