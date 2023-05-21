---
layout: default  
title:
permalink: /index
content-type: eg  
---  

## Featured
[My portfolio](https://khattamicah.tumblr.com)

### Paths to travel 

<div class="breakout">
  <div class="card-wrapper">
    <div class="card">
      <img class="image-small" src="../../assets/logo-small.png" alt="Logo">
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
      <img class="image-small" src="../../assets/logo-small.png" alt="Logo">
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
      <img class="image-small" src="../../assets/logo-small.png" alt="Logo">
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
      <img class="image-small" src="../../assets/logo-small.png" alt="Logo">
      <div>
        <h1 class="card-h1">
          [[Hoardings]]
        </h1>
        <p class="card-p">
          Bunch of collections from all over the internet, from zines to recipes
        </p>
      </div>
    </div>
    <div class="card">
      <img class="image-small" src="../../assets/logo-small.png" alt="Logo">
      <div>
        <h1 class="card-h1">
          [[Seedling ideas]]
        </h1>
        <p class="card-p">
          Slowly making sense of certain things
        </p>
      </div>
    </div>
    <div class="card">
      <img class="image-small" src="../../assets/logo-small.png" alt="Logo">
      <div>
        <h1 class="card-h1">
          [[otherthings about me]]
        </h1>
        <p class="card-p">
          What it says on the tin
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
    width: 100%;
    height: auto;
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

