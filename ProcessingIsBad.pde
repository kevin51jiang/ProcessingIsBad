import java.util.*;

ScreenManager sm;
void setup() {
    size(640, 480);
      sm = new ScreenManager();
  sm.add(new TestMenu(sm));
}


void draw() {
    sm.display();

}






/**
*
*
*
*/
abstract class Screen {
    private ScreenManager scrnMgr;
    public String uid;
    public abstract void display();

    public Screen (ScreenManager scrnMgr) {
        this.scrnMgr = scrnMgr;
    }

    public void setManager(ScreenManager scrnMgr) {
        this.scrnMgr = scrnMgr;
    }

    public ScreenManager getScreenManager(){
        return this.scrnMgr;
    }
}


class ScreenManager {
    public HashMap<String, Screen> screens = new HashMap<String, Screen>();
    public String currentScreenUid;

    final int transitionTime = 2000;//total time for transition/fade to black thing in milliseconds
    int currentTransitionProcess = -1;
    long lastTimeCheck;
    public ScreenManager(){}

    public void display(){
        screens.get(currentScreenUid).display();
    }

    public void add(Screen toAdd){
        screens.put(toAdd.uid, toAdd);
    }

    /**
    * Removes a Screen from the screens map, making it impossible to use in the future.
    * Most likely won't ever be used since a HashMap has a lookup time of O(1)
    */
    public void remove(String screenUid){
        screens.remove(screenUid);
    }


    /**
    * Changes the screen e.g. from main menu to actual game.
    * Also deals with starting the thing to fade the whole screen to black and back.
    */
    public void changeScreen(String screenUid){
        this.currentScreenUid = screenUid;
        this.currentTransitionProcess = 0;
        lastTimeCheck = millis();
    }



}


class TestMenu extends Screen{

    public String uid = "TestScreen";
    public void display(){
        background(128);
        text(("This is test screen" + millis()), 40, 40, 100, 100);

        rect(200, 200, 350, 200);
    }

    public TestMenu () {
        
    }

}