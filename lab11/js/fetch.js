function show(){
  fetch('data.csv')
    .then(response => {
      if(!response.ok){
        throw new Error('No se concretó la solicitud');
      }
      return response.text();
    })
    .then(data => {
      String(data);
      table(data);
    })
    .catch(err => console.error("Error", err));
}
function table(data){
  const kind = document.getElementById("kind").value;
  const keyword = document.getElementById("keyword").value;
  const lines = data.split("\n");
  for(const line in lines){
    const mydata = line.split("|");
    const params = find(line, mydata);
    const value = params.get(kind);
  }
}
function find(line,mydata){
  const uni = new Map([
    ["name", mydata[1]],
    ["period", mydata[4]],
    ["localRegion", mydata[10]],
    ["studyProgram", mydata[16]]
  ]);
  return uni;
} 
