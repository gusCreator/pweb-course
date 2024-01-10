function show(){
  fetch('data.csv')
    .then(response => {
      if(!response.ok){
        throw new Error('No se concretó la solicitud');
      }
      return response.text();
    })
    .then(() => {
      console.log("wait");
      table();
    })
    .catch(err => console.error("Error", err));
}
function table(){
  const kind = document.getElementById("kind").value;
  const keyword = document.getElementById("keyword").value;
  console.log(kind,keyword);
}
