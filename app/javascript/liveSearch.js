document.addEventListener('turbo:load', () => {
  const input = document.querySelector('#search-input');
  input.addEventListener('keyup', (e) => {
    const query = e.target.value.toLowerCase();
    const searchList = document.querySelector('#search-list');

    clearTimeout(e.target.delay);
    e.target.delay = setTimeout(function() {
      // console.log(query);
      fetch(`/searches`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        },
        body: JSON.stringify({ query })
      });
      let newSearch = `<li>${query}</li>`;
      searchList.insertAdjacentHTML('afterbegin', newSearch);
      if (searchList.lastElementChild && query !== "") {
        searchList.lastElementChild.remove();
      }
    }, 700);

  });
});
// The code above is a simple JavaScript snippet that listens for the keyup event on the search input field. When a user types a query, the code sends a POST request to the /searches endpoint with the query as the request body. The server will then process the request and return the search results as JSON data.