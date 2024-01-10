function show(){
  if(document.getElementById("keyword").value == ''){alert("Ingrese palabras clave en el campo"); return;}
  document.getElementsByTagName("table").item(0).style.display = "block";
  fetch('data_utf8.csv')
    .then(response => {
      if(!response.ok){
        throw new Error('No se concretó la solicitud');
      }
      const t = response.text();
      console.log(t);
      return t;
    })
    .then(dat => {
      const data = String(dat);
      table(data);
    })
    .catch(err => console.error("Error", err));
}
function table(data){
  const table = document.getElementsByTagName("table").item(0);
  const tbody = table.getElementsByTagName("tbody").item(0);
  tbody.innerHTML = '';
  const kind = document.getElementById("kind").value;
  const keyword = document.getElementById("keyword").value;
  const lines = data.split("\n");
  for(const line of lines){
    const mydata = line.split("|");
    const params = find(line, mydata);
    const value = params.get(kind);
    if(!(typeof value === 'undefined') && value.includes(keyword.toUpperCase())){
      const row = document.createElement("tr");
      tbody.appendChild(row);
      const totable = [mydata[1], mydata[2], mydata[3],
        mydata[4], mydata[7], mydata[8], 
        mydata[10], mydata[11], mydata[12], 
        mydata[15], mydata[16], mydata[17], 
        mydata[18]];
      for(const unis of totable){
        const el = document.createElement("td");
        el.innerHTML = unis;
        row.appendChild(el);
      }
    }
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
