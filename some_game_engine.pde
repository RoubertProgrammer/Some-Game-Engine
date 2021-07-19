import g4p_controls.*;

//GWindow window;
JSONObject availableProjects;
JSONObject loadProjects;
JSONArray projectName;
JSONObject engine;
PImage load_a_game;
PImage create_a_game;
PImage logo;
Boolean loading_Project = false;
String project = "";

void NewPlayer() {
  JSONObject json;
  json = loadJSONObject("player_properties.json");
  String Player_name = json.getString("name");
  float Player_x = json.getFloat("x");
  float Player_y = json.getFloat("y");
  textSize(15);
  text(Player_name, Player_x, Player_y);
  rect(Player_x, Player_y, 50, 50);
  println(Player_name + Player_x + Player_y);
}

void setup() {
    
    background(155);
    
    
    engine = new JSONObject();
    engine.setString("version", "0.1.0");
    engine.setString("ProjectToLoad", "1");
    engine.setBoolean("LoadProjectWhenOpenedTheEngine", false);
    saveJSONObject(engine, "options.json");
  
    createOutput("projects/projectTemplate/some_template_so_you_can_have_an_idea");
    size(800, 600);
    //window = GWindow.getWindow(this, "A test window", 100, 50, 800, 600, P2D);
    availableProjects = new JSONObject();
    availableProjects.setString("1", "project1");
    availableProjects.setString("0", "projectTemplate");
    saveJSONObject(availableProjects, "project_list.json");
    smooth(0);
    load_a_game = loadImage("load.png");
    create_a_game = loadImage("create.png");
    logo = loadImage("gameenginelogo.png");
}

void draw() {
    
    if(engine.getBoolean("LoadProjectWhenOpenedTheEngine") == true) {
      
    }
  
    project = project + key;
    
    image(load_a_game, 200, 400, 59, 59);
    image(create_a_game, 480, 400, 59, 59);
    image(logo, 220, 0, 300, 300);
    textSize(30);
    text("(L)", 210, 490);
    textSize(30);
    text("(C)", 490, 490);
    
    if(keyPressed) {
      if(key == 'c' || key == 'C') {
        JSONObject P;
        JSONObject main;
        P = new JSONObject();
        main = new JSONObject();
        P.setString("name", "player");
        P.setFloat("x", 200);
        P.setFloat("y", 400);
        main.setString("projectName", "name here");
        main.setBoolean("HasPlayer?", false);
        main.setBoolean("CustomCode?", false);
        saveJSONObject(main, "projects/project1/main.json");
        saveJSONObject(P, "projects/project1/player.json");
            JSONArray voids;
            JSONObject init_objs;
            JSONArray init;
            JSONArray draw;
            JSONObject draw_objs;
            voids = new JSONArray();
            init = new JSONArray();
            draw = new JSONArray();
            init_objs = new JSONObject();
            draw_objs = new JSONObject();
            init_objs.setString("void", "setup");
            draw_objs.setString("void", "draw");
            init.setJSONObject(1, init_objs);
            init.setJSONObject(2, draw_objs);
            saveJSONArray(init, "projects/project1/customCode.json");
            println("Completed Creating The File!");
      }
      if(key == 'l' || key == 'L') {
        background(155);
        JSONObject load_id;
        JSONObject list_id;
        JSONObject game;
        load_id = loadJSONObject("options.json");
        list_id = loadJSONObject("project_list.json");
        String ID = load_id.getString("ProjectToLoad");
        String list = list_id.getString(ID);
        game = loadJSONObject("projects/" + list + "/main.json");
        Boolean HasPlayer = game.getBoolean("HasPlayer?");
        Boolean CustomCode = game.getBoolean("CustomCode?");
        if(HasPlayer == true) {
          JSONObject player;
          player = loadJSONObject("projects/" + list + "/player.json");
          String name = player.getString("name");
          float x = player.getFloat("x");
          float y = player.getFloat("y");
          rect(x, y, 50, 50);
          textSize(30);
          text(name, x, y);
        }
        if(CustomCode == true) {
          JSONArray customcode;
          customcode = loadJSONArray("projects/" + list + "/customCode.json"); 
          JSONArray init;
        }
      }
    }
}
