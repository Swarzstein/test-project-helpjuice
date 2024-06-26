// let capitalizeAll = (str) => {
//   return str.replace(/\b\w/g, (char) => char.toUpperCase());
// };

document.addEventListener('turbo:load', () => {
  const input = document.querySelector('#search-input');
  input.addEventListener('keyup', (e) => {
    const query = e.target.value.toLowerCase();
    const searchList = document.querySelector('#search-list');
    const csrfTokenMeta = document.querySelector('[name="csrf-token"]');

    clearTimeout(e.target.delay);
    e.target.delay = setTimeout(function() {
      fetch(`/searches`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfTokenMeta ? csrfTokenMeta.content : 'undefined-token'
        },
        body: JSON.stringify({ query })
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        let newSearch = `<li>${data.search}</li>`;
        // let newSearch = `<li>${capitalizeAll(data.search)}</li>`;
        searchList.insertAdjacentHTML('afterbegin', newSearch);
        if (searchList.children.length > 10 && query !== "") {
          searchList.lastElementChild.remove();
        }
      });
    }, 650);
  });
});

// The code above is a simple JavaScript snippet that listens for the keyup event on the search input field. When a user types a query, the code sends a POST request to the /searches endpoint with the query as the request body. The server will then process the request and return the search results as JSON data retrieving it to the DOM for mock live search.  
