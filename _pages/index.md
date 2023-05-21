---
layout: default  
title:
permalink: /index
content-type: eg  
---  

## Featured
<iframe src="https://khattamicah.tumblr.com" allow="fullscreen" allowfullscreen="" style="height: 100%; width:500px; aspect-ratio: 16 / 9;"></iframe>

### Paths to travel 

<div class="breakout">
  <div class="card-wrapper">
    <div class="card">
      <img class="image-small" src="assets/img/help-circle.svg" alt="Logo">
      <div>
        <h1 class="card-h1">
          [[Tutorials]]
        </h1>
        <p class="card-p">
          I try making different things and gather tutorials in the process, here lie many
        </p>
      </div>
    </div>
    <div class="card">
      <img class="image-small" src="assets/img/book-open.svg" alt="Logo">
      <div>
        <h1 class="card-h1">
          [[Review of my readings]]
        </h1>
        <p class="card-p">
          The art of half-baked unfinished reading.
        </p>
      </div>
    </div>
    <div class="card">
      <img class="image-small" src="assets/img/tool.svg" alt="Logo">
      <div>
        <h1 class="card-h1">
          [[Makings]]
        </h1>
        <p class="card-p">
          Different things I'm making, doing
        </p>
      </div>
    </div>
    <div class="card">
      <img class="image-small" src="assets/img/archive.svg" alt="Logo">
      <div>
        <h1 class="card-h1">
          [[Hoarding]]
        </h1>
        <p class="card-p">
          Bunch of collections from all over the internet, from zines to recipes
        </p>
      </div>
    </div>
    <div class="card">
      <img class="image-small" src="assets/img/key.svg" alt="Logo">
      <div>
        <h1 class="card-h1">
          [[Seedlings]]
        </h1>
        <p class="card-p">
          Slowly making sense of certain things
        </p>
      </div>
    </div>
  </div>
</div>







<style>
  .card-wrapper {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
  }

  .card {
    width: 200px;
    height: 200px;
    border: 1px solid #ccc;
    padding: 10px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

.card img {
	width: 90px;
	height: auto;
}

.card svg {
	fill: cyan;
	stroke: cyan;
}


  .card h1 {
    margin: 10px 0;
    font-size: 1em;
  }

  .card p {
    font-size: 14px;
  }
</style>


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

