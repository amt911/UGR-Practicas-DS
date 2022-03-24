
import java.util.Observable;
import java.util.Random;

public class Temperatura extends Observable implements Runnable {

    private float _temp;

    public Temperatura() {
        Random r = new Random();
        _temp = (50 - 20) * r.nextFloat() - 15;
    }

    public float getTemp() {
        return this._temp;
    }

    public void setTemp(float aTemp) {
        _temp = aTemp;
        notifyObservers();
        setChanged();
    }

    private void esperartiempo() {
        try {
            Thread.sleep(1 * 3000);
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
    }

    @Override
    public void run() {
        for (int k = 0; k < 14; k++) {
            Random r = new Random();
            setTemp((50 - 20) * r.nextFloat() - 15);
            esperartiempo();
        }
    }
}
