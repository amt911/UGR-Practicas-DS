import java.util.Observable;
import java.util.Random;

public class Temperatura extends Observable implements Runnable {
	private float _temp;

	public float getTemp() {
		return this._temp;
	}

	public void setTemp(float aTemp) {
		
	}
        private void esperartiempo(){
            try {
			Thread.sleep(1 * 1000);
		} catch (InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
        }

    @Override
    public void run() {
        Random r = new Random();
        _temp = (50 - 20)*r.nextFloat() -15;
        setChanged();
        notifyObservers();
        esperartiempo();
    }
}