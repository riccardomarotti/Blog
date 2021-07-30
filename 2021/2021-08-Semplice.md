Title: Facile contro Semplice
Category: 
Tags: 
Abstract: 
Status: draft

Facile

```bash
curl "https://quality.coosmo.io/meta/culturalItems" | jq '._embedded.culturalItems[]._links.self.href' | sed 's/"//g'
```

Semplce

```bash
curl "https://quality.coosmo.io/meta/culturalItems" | jq -r '._embedded.culturalItems[]._links.self.href'
```

