---
layout: default  
title:
permalink: /index
content-type: eg  
---  

## Featured
[My portfolio](https://khattamicah.tumblr.com)

### Paths to travel 
1. [[Random Tutorials I am Collecting]]
2. [[Review of my readings]]
3. [[My Projects or Things I Made]]
4. [[I am hoarding a bunch of things]]
5. [[my baby ideas - slowww thinking]]
6. [[otherthings about me]]


### Recently updated
<ul>
  {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
  {% for note in recent_notes limit: 5 %}
    <li>
      {{ note.last_modified_at | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ note.url }}">{{ note.title }}</a>
    </li>
  {% endfor %}
</ul>

<!-- The tracker used is from insights, a cookieless, privacy-centric tracker-->
<script src="https://getinsights.io/js/insights.js"></script>
<script>
insights.init('slvaMWvsRVntTw2h');
insights.trackPages();
</script>

