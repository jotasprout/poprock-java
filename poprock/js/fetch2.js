

function fetchFacts(){
    const url = "http://musicbrainz.org/ws/2/artist/5182c1d9-c7d2-4dad-afa0-ccfeada921a8?inc=release-groups&fmt=json";

    const init = {
        method: "GET",
        
        Headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
        }
    };
    
    // fetch(url, init).then(res => console.log(res));
    fetch(url, init).then((res) => {
        console.log(res);
        return res.json();
      })
      .then((data) => console.log(data));
}

fetchFacts();

