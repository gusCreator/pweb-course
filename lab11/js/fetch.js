fetch('data.csv')
.then(response => {
  if(!response.ok){
    throw new Error('No se concretó la solicitud');
  }
  return response.text();
})
.then(data => {
  console.log("Datos obtenidos", data);
})
.catch(err => console.error("Error", err));
function show(){
  console.log("show...");
}
