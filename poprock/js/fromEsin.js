fetch(
    "https://musicbrainz.org/ws/2/area/45f07934-675a-46d6-a577-6f8637a411b1",
    {
      headers: {
        Accept: "application/json",
        "User-Agent": "X Test/1.2.0 ( useremail@xmail.com )"
      }
    }
  )
    .then((res) => {
      console.log(res);
      return res.json();
    })
    .then((data) => console.log(data));