// Replace with your own values
const searchClient = algoliasearch(
  APP_ID,
  SECURED_API_KEY // search only API key, no ADMIN key
);

const search = instantsearch({
  indexName: 'posts',
  searchClient,
  routing: true,
});

search.addWidget(
  instantsearch.widgets.configure({
    hitsPerPage: 10,
  })
);

search.addWidget(
  instantsearch.widgets.searchBox({
    container: '#search-box',
    placeholder: 'Search for products',
  })
);

search.addWidget(
  instantsearch.widgets.hits({
    container: '#hits',
    templates: {
      item: document.getElementById('hit-template').innerHTML,
      empty: `We didn't find any results for the search <em>"{{query}}"</em>`,
    },
  })
);

search.start();

