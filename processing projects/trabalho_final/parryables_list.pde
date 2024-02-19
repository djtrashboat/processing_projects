class ParryList{
    ArrayList<Parryable> ps = new ArrayList<Parryable>();
    int n;
    int defaultsizeX;
    int defaultsizeY;


    ParryList(){
        n = 0;
        defaultsizeX = 50;
        defaultsizeY = 50;
    }

    void addParry(float tx, float ty){
        ps.add(new Parryable(tx, ty, defaultsizeX, defaultsizeY));
        n++;
    }

    void addParry(float tx, float ty, int sx, int sy){
        ps.add(new Parryable(tx, ty, sx, sy));
        n++;
    }

    void display(){
        for(int i = 0; i<n; i++){
            Parryable p = ps.get(i);
            p.display();
        }

    }

    boolean checkPlayer(Player play){
        for(int i=0; i<n; i++){
            Parryable p = ps.get(i);
            if(p.checkPlayer(play.x,play.y,play)){
                return true;
            }
        }
        return false;
    }

    void setDefaultSizeX(int dx){
        defaultsizeX = dx;
    }
    void setDefaultSizeY(int dy){
        defaultsizeY = dy;
    }

}
