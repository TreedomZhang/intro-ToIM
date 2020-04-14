//Treedom Zhang
//April14
//Assignment name "Ten Smallest Countries in the World"
//In this assignment, the keys from 1-0 are associated with the smallest country to the tenth smallest country in the world. These countries are represented as individual circles and their 
//respective radius is equal to the land area of that country (in km squared).
//CSV File from    https://data.worldbank.org/indicator/AG.LND.TOTL.K2
//CSV File name    API_AG.LND.TOTL.K2_DS2_en_csv_v2_937279.csv




Country[] countries = new Country[10]; //array of countries
Table table;

void setup(){
  size(800,800);
  loadData();// call function load data
  
}

void draw(){
  background(158, 149, 163);
  for (int i=0; i<countries.length; i++){
    if (countries[i] != null) {
      countries[i].display(i);
      
    }
  }
}

void loadData() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
  table = loadTable("API_AG.LND.TOTL.K2_DS2_en_csv_v2_937279.csv", "header");
}

 void keyPressed () {
if (keyPressed) {
      switch (key) {
      case '1': // if "1" is pressed, show the smallest country
        println("1 is pressed");
        TableRow row = table.getRow(0);
        String countryName = row.getString("Country Name");
        float landArea2018 = row.getFloat("2018"); // get index ("country name" and "land area in 2018") from the file
        
        //println(countryName);
        //println(landArea2018); //try to check whether key is pressed
        countries[0] = new Country(landArea2018, countryName); 
        countries[0].display(landArea2018);// draw the first country
        break;
        
        
        case '2': // second smallest country
        row = table.getRow(1);
        countryName = row.getString("Country Name"); 
        landArea2018 = row.getFloat("2018"); 
        countries[1] = new Country(landArea2018, countryName); 
        countries[1].display(landArea2018);
        break;
        
        
        case '3': // third smallest
        row = table.getRow(2);
        countryName = row.getString("Country Name");
        landArea2018 = row.getFloat("2018"); 
        countries[2] = new Country(landArea2018, countryName); 
        countries[2].display(landArea2018);
        break;
        
        
        case '4': // forth
        row = table.getRow(3);
        countryName = row.getString("Country Name");
        landArea2018 = row.getFloat("2018"); 
        countries[3] = new Country(landArea2018, countryName); 
        countries[3].display(landArea2018);
        break;
        
        
        case '5': 
        row = table.getRow(4);
        countryName = row.getString("Country Name");
        landArea2018 = row.getFloat("2018"); 
        countries[4] = new Country(landArea2018, countryName); 
        countries[4].display(landArea2018);
        break;
        
        case '6':  
        row = table.getRow(5);
        countryName = row.getString("Country Name");
        landArea2018 = row.getFloat("2018"); 
        countries[5] = new Country(landArea2018, countryName); 
        countries[5].display(landArea2018);
        break;
        
        case '7':  
        row = table.getRow(6);
        countryName = row.getString("Country Name");
        landArea2018 = row.getFloat("2018"); 
        countries[6] = new Country(landArea2018, countryName); 
        countries[6].display(landArea2018);
        break;
        
        case '8':  
        row = table.getRow(7);
        countryName = row.getString("Country Name");
        landArea2018 = row.getFloat("2018"); 
        countries[7] = new Country(landArea2018, countryName); 
        countries[7].display(landArea2018);
        break;
        
        
        case '9': 
        row = table.getRow(8);
        countryName = row.getString("Country Name");
        landArea2018 = row.getFloat("2018"); 
        countries[8] = new Country(landArea2018, countryName); 
        countries[8].display(landArea2018);
        break;
        
        case '0': // the biggest country among these 10 countries
        row = table.getRow(9);
        countryName = row.getString("Country Name");
        landArea2018 = row.getFloat("2018"); 
        countries[9] = new Country(landArea2018, countryName); 
        countries[9].display(landArea2018);
        break;
       
      }
    }
}


class Country{
   float landArea;
   String name;
   
   Country(float landArea, String name){
     this.landArea = landArea;
     this.name = name;
   }// constructor
   
   void display(float xPos){
     xPos = map(xPos, 0, 180, 0, width-90);// the xPos is related to the country's land area, the biggest land area among the ten is 180km squared
     fill (102, 61, 125);
     noStroke();
     ellipse(xPos,height/2,landArea,landArea); // the radius of the circle representing a country is equal to its land area
     fill(67, 53, 74);
     strokeWeight (2);
     textSize (20);
     text (name,xPos,height/2);
   }
}
