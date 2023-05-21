---
layout: default
tags: 
source:
compiler:
category:
title: All Tags
permalink: /tags
---


<div style="scroll-margin: 20px;" class="tags-container">
    <h3 class="tags-heading">See notes tagged under</h3>
    <div class="tags">
        {% assign tags = site.notes | map: 'tags' | join: ' ' | split: ' ' | uniq | sort %}
        {% for tag in tags %}
            <a class="tag" href="#{{tag}}" target="_self">{{ tag | replace: "-", "&nbsp;" }}</a>
        {% endfor %}
    </div>
	</div>

<main class="main-content" style="scroll-margin: 20em;">
    {% assign tags =  site.notes | map: 'tags' | join: ' ' | split: ' ' | sort %}
    {% for tag in tags %}
        <section class="tag-section" id="{{ tag }}">
            <h2 class="tag-heading">{{ tag | capitalize }}</h2>
            <ul class="notes-list">
                {% for note in site.notes %}
                    {% if note.tags contains tag %}
                        <li class="notes-item" style="padding-bottom: 0.6em; list-style: none;">
                            <a class="note-link" href="{{note.url}}" target="_self">{{ note.title }}</a>
                        </li>
                    {% endif %}
                {% endfor %}
            </ul>
            <div class="all-tags-link-container">
                <a class="all-tags-link" href="#" target="_self">All Tags</a>
            </div>
            <div style="min-height: 30vh;"></div>
        </section>
    {% endfor %}
</main>


<style>
.tags-container {
    scroll-margin: 20px;
}

.tags-heading {
    font-size: 1.5em;
}


.tag-link {
    margin-right: 10px;
}

.main-content {
    scroll-margin: 20em;
    padding: 20px;
    align-items: center;
}

.tag-section {
    margin-bottom: 20px;
}

.tag-heading {
    font-size: 1.3em;
}

.notes-list {
    list-style: none;
}

.notes-item {
    padding-bottom: 0.6em;
}

.note-link {
    text-decoration: none;
}

.all-tags-link-container {
    margin-top: 10px;
}

</style>