---
layout: default  
title:
permalink: /index
content-type: eg  
---  


## Hi, there you seem to 
> #### have found micah.alex on the www
##### here are the links to 

[My portfolio](https://khattamicah.tumblr.com)


### [[Random Tutorials I am Collecting]]

### [[Review of my readings]]

### [[My Projects or Things I Made]]

### [[I am hoarding a bunch of things]]

### [[my baby ideas - slowww thinking]]

### [[otherthings about me]]

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

